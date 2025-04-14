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
version    = '9031'
rubygems   = '3.6.8'
bundler    = '2.6.8'

@grubruby = Grubruby.new(repo_owner, repo_name, version, rubygems, bundler)

# VERSION, HASH, RAILS_VERSION
@supported_versions = [
  ['3.1.0', '1a0e0b69b9b062b6299ff1f6c6d77b66aff3995f63d1d8b8771e7a113ec472e2', 'rails70'],
  ['3.1.1', '7aefaa6b78b076515d272ec59c4616707a54fc9f2391239737d5f10af7a16caa', 'rails70'],
  ['3.1.2', 'ca10d017f8a1b6d247556622c841fc56b90c03b1803f87198da1e4fd3ec3bf2a', 'rails70'],
  ['3.1.3', '4ee161939826bcdfdafa757cf8e293a7f14e357f62be7144f040335cc8c7371a', 'rails70'],
  ['3.1.4', '1b6d6010e76036c937b9671f4752f065aeca800a6c664f71f6c9a699453af94f', 'rails70'],
  ['3.1.5', 'f9375a45bdf1cc41298558e7ac6c367f7b6cdcccf7196618b21f0886ff583b91', 'rails70'],
  ['3.1.6', '597bd1849f252d8a6863cb5d38014ac54152b508c36dca156f6356a9e63c6102', 'rails70'],
  ['3.1.7', '658acc455b6bda87ac6cc1380e86552b9c1af87055e7a127589c5bf7ed80b035', 'rails70'],

  ['3.2.0', 'd2f4577306e6dd932259693233141e5c3ec13622c95b75996541b8d5b68b28b4', 'rails70'],
  ['3.2.1', '746c8661ae25449cbdc5297d1092702e93e66f365a75fecb740d4f292ced630c', 'rails70'],
  ['3.2.2', '4b352d0f7ec384e332e3e44cdbfdcd5ff2d594af3c8296b5636c710975149e23', 'rails70'],
  ['3.2.3', 'cfb231954b8c241043a538a4c682a1cca0b2016d835fee0b9e4a0be3ceba476b', 'rails70'],
  ['3.2.4', 'e7f1653d653232ec433472489a91afbc7433c9f760cc822defe7437c9d95791b', 'rails70'],
  ['3.2.5', '7780d91130139406d39b29ed8fe16bba350d8fa00e510c76bef9b8ec1340903c', 'rails70'],
  ['3.2.6', '671134022238c2c4a9d79dc7d1e58c909634197617901d25863642f735a27ecb', 'rails70'],
  ['3.2.7', 'fc159b0d4a8ce412948fb69e61493839a0b3e1d5c919180f27036f1c948cfbe2', 'rails70'],
  ['3.2.8', '1cccd3100155275293ae5d4ea0a1a1068f5de69e71732220f144acce26327a3c', 'rails70'],

  ['3.3.0', '676b65a36e637e90f982b57b059189b3276b9045034dcd186a7e9078847b975b', 'rails70'],
  ['3.3.1', '0686941a3ec395a15ae2a852487b2a88e5fb8a5518e188df00d8d1bb71a6349b', 'rails70'],
  ['3.3.3', '83c0995388399c9555bad87e70af069755b5a9d84bbaa74aa22d1e37ff70fc1e', 'rails70'],
  ['3.3.4', '1caaee9a5a6befef54bab67da68ace8d985e4fb59cd17ce23c28d9ab04f4ddad', 'rails70'],
  ['3.3.5', '51aec7ea89b46125a2c9adc6f36766b65023d47952b916b1aed300ddcc042359', 'rails70'],
  ['3.3.6', '540975969d1af42190d26ff629bc93b1c3f4bffff4ab253e245e125085e66266', 'rails70'],
  ['3.3.7', '5dbcbc605e0ed4b09c52703241577eb7edc3a2dc747e184c72b5285719b6ad72', 'rails70'],
  ['3.3.8', '44ae70fee043da3ce48289b7a52618ebe32dc083253993d486211c7e445c8642', 'rails70'],

  ['3.4.0', '0081930db22121eb997207f56c0e22720d4f5d21264b5907693f516c32f233ca', 'rails70'],
  ['3.4.1', '018d59ffb52be3c0a6d847e22d3fd7a2c52d0ddfee249d3517a0c8c6dbfa70af', 'rails70'],
  ['3.4.2', 'ebf1c2eb58f5da17c23e965d658dd7e6202c5c50f5179154c5574452bef4b3e0', 'rails70'],
  ['3.4.3', '174dcd8c516694f833fd3c93ea227fa6c3321464577a3882a6fc7e4fe20237fd', 'rails70']
].reverse!
