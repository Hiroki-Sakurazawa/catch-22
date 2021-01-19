class Genre < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '心霊/怪奇' },
    { id: 2, name: '宇宙人/UFO' },
    { id: 3, name: 'UMA' },
    { id: 4, name: '都市伝説' },
    { id: 5, name: '廃墟' }
  ]

  include ActiveHash::Associations
  has_many :pictures
end
