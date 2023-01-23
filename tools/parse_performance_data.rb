require 'json'
require 'csv'

require 'bundler/inline'
gemfile do
  source 'https://rubygems.org'
  gem 'write_xlsx'
  gem 'chunky_png'
end

def colour(hex_code)
  colour_code = ChunkyPNG::Color(hex_code)
  {
    red: ChunkyPNG::Color.r(colour_code),
    green: ChunkyPNG::Color.g(colour_code),
    blue: ChunkyPNG::Color.b(colour_code)
  }
end

def colour_calculator(winner, loser, percentage)
  wc = colour(winner)
  lc = colour(loser)

  result_red = wc[:red] + percentage * (lc[:red] - wc[:red])
  result_green = wc[:green] + percentage * (lc[:green] - wc[:green])
  result_blue = wc[:blue] + percentage * (lc[:blue] - wc[:blue])
  result_code = ChunkyPNG::Color.rgb(result_red.to_i, result_green.to_i, result_blue.to_i)

  ChunkyPNG::Color.to_hex(result_code, false)
end

benchmark_headers = nil
workbook = WriteXLSX.new('results.xlsx')

# Setup colours
winner_colour = '#34A853'
winner = workbook.add_format(
  color: '#FFFFFF',
  bg_color: winner_colour
)
winner.set_bold

loser_colour = '#EA4335'
loser = workbook.add_format(
  bg_color: loser_colour
)
loser.set_bold

header_format = workbook.add_format
header_format.set_size(8)

scores = {}
scores_top = {}
scores_low = {}
benchmark_headers = nil

Dir.glob('*.json').each do |json_file_path|
  parsed = JSON.parse(File.open(json_file_path).read)

  benchmark_name = (parsed['ruby_details']['optflags'] + parsed['ruby_details']['debugflags'] + parsed['ruby_details']['runtimeflags']).join(' ')
  benchmark_headers ||= parsed['benchmarks'].keys

  raise "2 benchmarks with the same name? '#{benchmark_name}'" if scores[benchmark_name]
  scores[benchmark_name] = benchmark_headers.map { |bh| [bh, parsed['benchmarks'][bh]['mean']] }.to_h

  benchmark_headers.each do |bh|
    mean = parsed['benchmarks'][bh]['mean']

    if scores_top[bh]
      scores_top[bh] = mean if mean > scores_top[bh]
    else
      scores_top[bh] = mean
    end

    if scores_low[bh]
      scores_low[bh] = mean if mean < scores_low[bh]
    else
      scores_low[bh] = mean
    end
  end
end

worksheet = workbook.add_worksheet
worksheet.write_row(0, 0, ['Benchmark variant'] + benchmark_headers, header_format)
worksheet.set_column(0, 0, 35)

scores.each.with_index(1) do |score_data, row|
  variant, benchmark_scores = score_data
  worksheet.write(row, 0, variant, header_format)

  benchmark_scores.each.with_index(1) do |benchmark_score, column|
    benchmark, score = benchmark_score

    cell_format = if score == scores_low[benchmark]
      winner
    elsif score == scores_top[benchmark]
      loser
    else
      percentage = (score - scores_low[benchmark]) / (scores_top[benchmark] - scores_low[benchmark])

      workbook.add_format(
        bg_color: colour_calculator(winner_colour, loser_colour, percentage) 
      )
    end

    worksheet.write(row, column, score, cell_format)
  end
end
workbook.close
