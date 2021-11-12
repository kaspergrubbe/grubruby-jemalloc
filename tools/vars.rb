require 'open3'

class Grubruby
  def initialize(repo_owner, repo_name, version, rubygems_version, bundler_version)
    @repo_owner = repo_owner
    @repo_name = repo_name
    @version = version
    @rubygems_version = rubygems_version
    @bundler_version = bundler_version
  end

  attr_reader :repo_owner, :repo_name, :version, :rubygems_version, :bundler_version
end

repo_owner = 'kaspergrubbe'
repo_name  = 'grubruby-jemalloc'
version    = '9010'
rubygems   = '3.2.31'
bundler    = '2.2.31'

@grubruby = Grubruby.new(repo_owner, repo_name, version, rubygems, bundler)

# VERSION, HASH, NEEDS_THPOFF, RAILS_VERSION
@supported_versions = [
  ['2.4.4', '1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0',  true,  'rails52'],
  ['2.4.5', '2f0cdcce9989f63ef7c2939bdb17b1ef244c4f384d85b8531d60e73d8cc31eeb',  true,  'rails52'],
  ['2.4.6', '25da31b9815bfa9bba9f9b793c055a40a35c43c6adfb1fdbd81a09099f9b529c',  true,  'rails52'],
  ['2.4.7', 'a249193c7e79b891a4783f951cad8160fa5fe985c385b4628db8e9913bff1f98',  true,  'rails52'],
  ['2.4.8', 'a2a8f53ef14b891821dbbf67b081d7b9e223007a347000ff4a86a226a4708272',  true,  'rails52'],
  ['2.4.9', '0c4e000253ef7187feeb940a01a1c7594f28d63aa16f978e892a0e2864f58614',  true,  'rails52'],
  ['2.4.10', 'd5668ed11544db034f70aec37d11e157538d639ed0d0a968e2f587191fc530df', true,  'rails52'],
  ['2.5.1', '886ac5eed41e3b5fc699be837b0087a6a5a3d10f464087560d2d21b3e71b754d',  true,  'rails60'],
  ['2.5.2', '8be6b6afdf09957a6e2c2a6ada4b1982a391a828b34e49072c4beb60febb678d',  true,  'rails60'],
  ['2.5.3', '1cc9d0359a8ea35fc6111ec830d12e60168f3b9b305a3c2578357d360fcf306f',  true,  'rails60'],
  ['2.5.5', '9bf6370aaa82c284f193264cc7ca56f202171c32367deceb3599a4f354175d7d',  true,  'rails60'],
  ['2.5.6', '7601e4b83f4f17bc1affe091502dd465282ffba0761dea57c071ead21b132cee',  true,  'rails60'],
  ['2.5.7', '201870e8f58957d542233fef588b1d76f7bf962fea44dcbd2237f4a5899a3f95',  true,  'rails60'],
  ['2.5.8', '0391b2ffad3133e274469f9953ebfd0c9f7c186238968cbdeeb0651aa02a4d6d',  true,  'rails60'],
  ['2.5.9', 'a87f2fa901408cc77652c1a55ff976695bbe54830ff240e370039eca14b358f0',  true,  'rails60'],
  ['2.6.0', 'acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f',  false, 'rails60'],
  ['2.6.1', '47b629808e9fd44ce1f760cdf3ed14875fc9b19d4f334e82e2cf25cb2898f2f2',  false, 'rails60'],
  ['2.6.2', '91fcde77eea8e6206d775a48ac58450afe4883af1a42e5b358320beb33a445fa',  false, 'rails60'],
  ['2.6.3', '11a83f85c03d3f0fc9b8a9b6cad1b2674f26c5aaa43ba858d4b0fcc2b54171e1',  false, 'rails60'],
  ['2.6.4', 'df593cd4c017de19adf5d0154b8391bb057cef1b72ecdd4a8ee30d3235c65f09',  false, 'rails60'],
  ['2.6.5', 'd5d6da717fd48524596f9b78ac5a2eeb9691753da5c06923a6c31190abe01a62',  false, 'rails60'],
  ['2.6.6', '5db187882b7ac34016cd48d7032e197f07e4968f406b0690e20193b9b424841f',  false, 'rails60'],
  ['2.6.7', 'f43ead5626202d5432d2050eeab606e547f0554299cc1e5cf573d45670e59611',  false, 'rails60'],
  ['2.6.8', '8262e4663169c85787fdc9bfbd04d9eb86eb2a4b56d7f98373a8fcaa18e593eb',  false, 'rails60'],
  ['2.7.0', '27d350a52a02b53034ca0794efe518667d558f152656c2baaf08f3d0c8b02343',  false, 'rails60'],
  ['2.7.1', 'b224f9844646cc92765df8288a46838511c1cec5b550d8874bd4686a904fcee7',  false, 'rails60'],
  ['2.7.2', '1b95ab193cc8f5b5e59d2686cb3d5dcf1ddf2a86cb6950e0b4bdaae5040ec0d6',  false, 'rails60'],
  ['2.7.3', '5e91d1650857d43cd6852e05ac54683351e9c301811ee0bef43a67c4605e7db1',  false, 'rails60'],
  ['2.7.4', '2a80824e0ad6100826b69b9890bf55cfc4cf2b61a1e1330fccbcb30c46cef8d7',  false, 'rails60'],
  ['3.0.0', '68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1',  false, 'rails61'],
  ['3.0.1', 'd06bccd382d03724b69f674bc46cd6957ba08ed07522694ce44b9e8ffc9c48e2',  false, 'rails61'],
  ['3.0.2', '570e7773100f625599575f363831166d91d49a1ab97d3ab6495af44774155c40',  false, 'rails61']
]
