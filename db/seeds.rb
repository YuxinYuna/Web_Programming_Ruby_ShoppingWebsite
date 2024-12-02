Product.create([
  {
    name: "Beijing Roast Duck",
    description: "Peking Duck, or Beijing Kaoya, is a world-famous Chinese delicacy celebrated for its crispy golden-brown skin and tender, flavorful meat. The dish is traditionally served with thin pancakes, julienned cucumbers, green onions, and a rich hoisin sauce for dipping. The duck is carefully roasted to perfection, achieving a glossy and aromatic finish. Diners assemble the dish by wrapping the duck slices and accompaniments in the pancakes, creating a harmonious blend of textures and flavors. This dish is a true representation of Beijing's culinary artistry and elegance.",
    price: 150.99,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Beijing_Kaoya.png')
  },
  {
    name: "Sweet and Sour Pork",
    description: "Sweet and Sour Pork Ribs, or Tang Cu Pai Gu, is a classic Chinese dish featuring tender pork ribs coated in a glossy, tangy-sweet sauce made from vinegar, sugar, and soy sauce. The ribs are perfectly caramelized to achieve a balance of flavors, with a sticky and aromatic glaze. Garnished with toasted sesame seeds and freshly chopped scallions, this dish is both visually stunning and incredibly flavorful. It is typically enjoyed with steamed rice, making it a favorite comfort food in Chinese cuisine.",
    price: 20.5,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Sweet&Sour_Pork_Ribs.png')
  },
  {
    name: "Braised Beef Noodles",
    description: "Braised Beef Noodles, or Hong Shao Niu Rou Mian, is a classic Chinese comfort food featuring tender chunks of braised beef, chewy wheat noodles, and fresh bok choy immersed in a rich, aromatic broth. The broth, made with soy sauce, beef stock, and a blend of spices, has a deep red hue and an irresistibly savory flavor. Topped with green onions and cilantro, this dish is served hot in a traditional ceramic bowl, making it both visually stunning and incredibly satisfying. Perfect for a hearty meal, it is a favorite in Chinese households and restaurants alike.",
    price: 45.3,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Braised_Beef_Noodles.png')
  },
  {
    name: "Big Plate Chicken (Da Pan Ji)",
    description: "Big Plate Chicken, or Da Pan Ji, is a hearty and flavorful Chinese dish known for its generous portions and bold flavors. The dish features tender chicken pieces stewed with potatoes, bell peppers, and onions in a rich, spicy, and aromatic sauce. The sauce is a savory blend of soy sauce, chili, garlic, and warm spices, giving it a deep, satisfying taste. Garnished with fresh cilantro, it is often served with a side of hand-pulled noodles to soak up the flavorful sauce, making it a comforting and communal meal ideal for sharing.",
    price: 82,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Da_Pan_Ji.png')
  },
  {
    name: "Xiaolongbao (Soup Dumplings)",
    description: "Xiaolongbao, also known as soup dumplings, are a beloved Chinese delicacy traditionally steamed in bamboo baskets. These delicate dumplings feature a paper-thin wrapper encasing a savory pork filling and a burst of flavorful broth. Served piping hot, Xiaolongbao is typically enjoyed with a dipping sauce of soy sauce and vinegar, complemented by slivers of fresh ginger. The combination of juicy filling and soft, elastic dough makes it a unique and highly sought-after dish in Chinese cuisine.",
    price: 16.9,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Xiaolongbao.png')
  },
  {
    name: "Three Earthly Delights (Di San Xian)",
    description: "Di San Xian, or Three Earthly Delights, is a classic Chinese vegetarian dish featuring stir-fried eggplant, potatoes, and green bell peppers. The vegetables are cooked to perfection, creating a balance of tender and slightly crisp textures. Coated in a glossy, savory sauce made with soy sauce, garlic, and a touch of sweetness, the dish delivers rich umami flavors. Often garnished with fresh scallions, it is a comforting and flavorful representation of Northern Chinese home cooking, best enjoyed with steamed rice.",
    price: 48,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Di_San_Xian.png')
  },
  {
    name: "Buddha Jumps Over the Wall (Fo Tiao Qiang)",
    description: "Buddha Jumps Over the Wall, or Fo Tiao Qiang, is a legendary Chinese delicacy renowned for its luxurious ingredients and complex flavors. This dish is served in a traditional clay pot, featuring a rich and aromatic broth made with premium ingredients such as abalone, sea cucumber, fish maw, scallops, quail eggs, shiitake mushrooms, and chicken. Slow-cooked to perfection, it combines deep umami flavors with a smooth and hearty texture. Garnished with fresh herbs, this iconic dish represents the pinnacle of Chinese haute cuisine, symbolizing wealth, health, and indulgence.",
    price: 135,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Fo_Tiao_Qiang.png')
  },
  {
    name: "Sichuan Spicy Sliced Beef and Tripe (Fuqi Feipian)",
    description: "Fuqi Feipian, also known as Sichuan Spicy Sliced Beef and Tripe, is a classic dish from Sichuan cuisine celebrated for its bold flavors and enticing aroma. Thinly sliced beef and tripe are coated in a vibrant red chili oil sauce infused with Sichuan peppercorns, creating a numbing and spicy sensation. The dish is garnished with crushed peanuts, sesame seeds, and fresh cilantro, adding layers of texture and aroma. Served cold as an appetizer, this dish is a testament to Sichuan's mastery of combining heat and flavor in an unforgettable culinary experience.",
    price: 65.6,
    stock: 100,
    image_url: ActionController::Base.helpers.asset_path('Fuqi_Feipian.png')
  }
])

puts "Seed data loaded!"
