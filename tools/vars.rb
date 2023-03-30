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
version    = '9022'
rubygems   = '3.4.6'
bundler    = '2.4.6'

@grubruby = Grubruby.new(repo_owner, repo_name, version, rubygems, bundler)

# VERSION, HASH, RAILS_VERSION
@supported_versions = [
  ['2.6.0', 'acb00f04374899ba8ee74bbbcb9b35c5c6b1fd229f1876554ee76f0f1710ff5f',  'rails60'],
  ['2.6.1', '47b629808e9fd44ce1f760cdf3ed14875fc9b19d4f334e82e2cf25cb2898f2f2',  'rails60'],
  ['2.6.2', '91fcde77eea8e6206d775a48ac58450afe4883af1a42e5b358320beb33a445fa',  'rails60'],
  ['2.6.3', '11a83f85c03d3f0fc9b8a9b6cad1b2674f26c5aaa43ba858d4b0fcc2b54171e1',  'rails60'],
  ['2.6.4', 'df593cd4c017de19adf5d0154b8391bb057cef1b72ecdd4a8ee30d3235c65f09',  'rails60'],
  ['2.6.5', 'd5d6da717fd48524596f9b78ac5a2eeb9691753da5c06923a6c31190abe01a62',  'rails60'],
  ['2.6.6', '5db187882b7ac34016cd48d7032e197f07e4968f406b0690e20193b9b424841f',  'rails60'],
  ['2.6.7', 'f43ead5626202d5432d2050eeab606e547f0554299cc1e5cf573d45670e59611',  'rails60'],
  ['2.6.8', '8262e4663169c85787fdc9bfbd04d9eb86eb2a4b56d7f98373a8fcaa18e593eb',  'rails60'],
  ['2.6.9', '6a041d82ae6e0f02ccb1465e620d94a7196489d8a13d6018a160da42ebc1eece',  'rails60'],
  ['2.6.10', '5fd8ded51321b88fdc9c1b4b0eb1b951d2eddbc293865da0151612c2e814c1f2', 'rails60'],
  ['2.7.0', '27d350a52a02b53034ca0794efe518667d558f152656c2baaf08f3d0c8b02343',  'rails60'],
  ['2.7.1', 'b224f9844646cc92765df8288a46838511c1cec5b550d8874bd4686a904fcee7',  'rails60'],
  ['2.7.2', '1b95ab193cc8f5b5e59d2686cb3d5dcf1ddf2a86cb6950e0b4bdaae5040ec0d6',  'rails60'],
  ['2.7.3', '5e91d1650857d43cd6852e05ac54683351e9c301811ee0bef43a67c4605e7db1',  'rails60'],
  ['2.7.4', '2a80824e0ad6100826b69b9890bf55cfc4cf2b61a1e1330fccbcb30c46cef8d7',  'rails60'],
  ['2.7.5', 'd216d95190eaacf3bf165303747b02ff13f10b6cfab67a9031b502a49512b516',  'rails60'],
  ['2.7.6', '54dcd3044726c4ab75a9d4604720501442b229a3aed6a55fe909567da8807f24',  'rails60'],
  ['2.7.7', 'b38dff2e1f8ce6e5b7d433f8758752987a6b2adfd9bc7571dbc42ea5d04e3e4c',  'rails60'],
  ['3.0.0', '68bfaeef027b6ccd0032504a68ae69721a70e97d921ff328c0c8836c798f6cb1',  'rails61'],
  ['3.0.1', 'd06bccd382d03724b69f674bc46cd6957ba08ed07522694ce44b9e8ffc9c48e2',  'rails61'],
  ['3.0.2', '570e7773100f625599575f363831166d91d49a1ab97d3ab6495af44774155c40',  'rails61'],
  ['3.0.3', '88cc7f0f021f15c4cd62b1f922e3a401697f7943551fe45b1fdf4f2417a17a9c',  'rails61'],
  ['3.0.4', '8e22fc7304520435522253210ed0aa9a50545f8f13c959fe01a05aea06bef2f0',  'rails61'],
  ['3.0.5', 'cf7cb5ba2030fe36596a40980cdecfd79a0337d35860876dc2b10a38675bddde',  'rails61'],
  ['3.1.0', '1a0e0b69b9b062b6299ff1f6c6d77b66aff3995f63d1d8b8771e7a113ec472e2',  'rails61'],
  ['3.1.1', '7aefaa6b78b076515d272ec59c4616707a54fc9f2391239737d5f10af7a16caa',  'rails61'],
  ['3.1.2', 'ca10d017f8a1b6d247556622c841fc56b90c03b1803f87198da1e4fd3ec3bf2a',  'rails61'],
  ['3.1.3', '4ee161939826bcdfdafa757cf8e293a7f14e357f62be7144f040335cc8c7371a',  'rails61'],
  ['3.2.0', 'd2f4577306e6dd932259693233141e5c3ec13622c95b75996541b8d5b68b28b4',  'rails61'],
  ['3.2.1', '746c8661ae25449cbdc5297d1092702e93e66f365a75fecb740d4f292ced630c',  'rails61']
  ['3.2.2', '4b352d0f7ec384e332e3e44cdbfdcd5ff2d594af3c8296b5636c710975149e23',  'rails61']
]
