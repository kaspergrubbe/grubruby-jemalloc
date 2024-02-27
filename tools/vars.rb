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
version    = '9025'
rubygems   = '3.5.6'
bundler    = '2.5.6'

@grubruby = Grubruby.new(repo_owner, repo_name, version, rubygems, bundler)

# VERSION, HASH, RAILS_VERSION
@supported_versions = [
  ['3.0.0', '68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1', 'rails70'],
  ['3.0.1', 'd06bccd382d03724b69f674bc46cd6957ba08ed07522694ce44b9e8ffc9c48e2', 'rails70'],
  ['3.0.2', '570e7773100f625599575f363831166d91d49a1ab97d3ab6495af44774155c40', 'rails70'],
  ['3.0.3', '88cc7f0f021f15c4cd62b1f922e3a401697f7943551fe45b1fdf4f2417a17a9c', 'rails70'],
  ['3.0.4', '8e22fc7304520435522253210ed0aa9a50545f8f13c959fe01a05aea06bef2f0', 'rails70'],
  ['3.0.5', 'cf7cb5ba2030fe36596a40980cdecfd79a0337d35860876dc2b10a38675bddde', 'rails70'],
  ['3.0.6', 'b5cbee93e62d85cfb2a408c49fa30a74231ae8409c2b3858e5f5ea254d7ddbd1', 'rails70'],

  ['3.1.0', '1a0e0b69b9b062b6299ff1f6c6d77b66aff3995f63d1d8b8771e7a113ec472e2', 'rails70'],
  ['3.1.1', '7aefaa6b78b076515d272ec59c4616707a54fc9f2391239737d5f10af7a16caa', 'rails70'],
  ['3.1.2', 'ca10d017f8a1b6d247556622c841fc56b90c03b1803f87198da1e4fd3ec3bf2a', 'rails70'],
  ['3.1.3', '4ee161939826bcdfdafa757cf8e293a7f14e357f62be7144f040335cc8c7371a', 'rails70'],
  ['3.1.4', '1b6d6010e76036c937b9671f4752f065aeca800a6c664f71f6c9a699453af94f', 'rails70'],

  ['3.2.0', 'd2f4577306e6dd932259693233141e5c3ec13622c95b75996541b8d5b68b28b4', 'rails70'],
  ['3.2.1', '746c8661ae25449cbdc5297d1092702e93e66f365a75fecb740d4f292ced630c', 'rails70'],
  ['3.2.2', '4b352d0f7ec384e332e3e44cdbfdcd5ff2d594af3c8296b5636c710975149e23', 'rails70'],
  ['3.2.3', 'cfb231954b8c241043a538a4c682a1cca0b2016d835fee0b9e4a0be3ceba476b', 'rails70'],

  ['3.3.0', '676b65a36e637e90f982b57b059189b3276b9045034dcd186a7e9078847b975b', 'rails70']
].reverse!
