class Prefecture < ActiveHash::Base

  self.data = [
      {id: 1, name: '生ビール', price: 500, genre: 0}, {id: 2, name: '瓶ビール(大)' price: 600, genre: 0}, {id: 3, name: 'ホッピー' price:400 , genre: 1},
      {id: 4, name: '黒ホッピー' price:400 , genre: 1}, {id: 5, name: 'バイスサワー' price:400 , genre: 1}, {id: 6, name: 'ウーロンハイ' price:400 , genre: 1},
      {id: 7, name: '緑茶ハイ' price:400 , genre: 1}, {id: 8, name: 'レモンサワー' price:400 , genre: 1}, {id: 9, name: '青リンゴサワー' price:400 , genre: 1},
      {id: 10, name: 'GFサワー' price:400 , genre: 1}, {id: 11, name: 'シークワーサーサワー' price:400 , genre: 1}, {id: 12, name: 'クエン酸サワー' price:400 , genre: 1},
      {id: 13, name: 'ざくろサワー' price:400 , genre: 1}, {id: 14, name: 'ライムサワー' price:400 , genre: 1}, {id: 15, name: 'チューハイ' price:400 , genre: 1},
      {id: 16, name: 'ウメサワー' price:400 , genre: 1}, {id: 17, name: '梅酒サワー' price:400 , genre: 1}, {id: 18, name: 'トマトハイ' price:400 , genre: 1},
      {id: 19, name: '梅干し(1個)' price: 50, genre: 1}, {id: 20, name: '中' price: 220, genre: 1}, {id: 21, name: 'グラス(赤)' price: 350, genre: 2},
      {id: 22, name: 'コーラ' price: 200, genre: 3}, {id: 23, name: 'ジンジャーエール' price: 200, genre: 3}, {id: 24, name: 'オレンジジュース' price: 200, genre: 3},
      {id: 25, name: 'ウーロン茶' price: 200, genre: 3}
  ]

end