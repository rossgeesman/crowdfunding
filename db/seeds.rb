# encoding: utf-8

Collaborator.delete_all
Product.delete_all
Collaborator.create!(name_en: 'Ross Geesman',
  name_kr: '이로스',
  bio_en: 
    %{<p>
        Ross is a guy who lives in Seoul and likes doing nothing
        for long streteches of time.
      </p>},
  bio_kr: 
    %{<p>
        이 잉잉 소스라치자 듯이 이리 누워 석쇠에 남편은 싶었다. 먹이를 내는 들어와 
        자기 닿지 한기가 소리 떡 다가들었다. 그날 세워 위로 안됐데 놈에게 여보게, 
        오라질년 되는 싫었음일까? 김첨지는 마음이 눈이 아니로되, 이렇게 앉은 말았다.
      </p>},   
  image_url: 'Ross.jpg',)
  .products.create!([
    {
      title_en: 'Brown Shoes',
      title_kr: '브라운 슈즈',
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url: 'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    },
    {
      title_en: 'Hat',
      title_kr: '모자',
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url: 'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    },
    {
      title_en: 'Blue Shirt',
      title_kr: '파란 셔츠',
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url:   'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    }
])

Collaborator.create!(name_en: 'John Doe',
  name_kr: '알렉스 핀치',
  bio_en: 
    %{<p>
      John Doe is a man on a mission.
      </p>},
  bio_kr: 
    %{<p>
        이 잉잉 소스라치자 듯이 이리 누워 석쇠에 남편은 싶었다. 먹이를 내는 들어와 
        자기 닿지 한기가 소리 떡 다가들었다. 그날 세워 위로 안됐데 놈에게 여보게, 
        오라질년 되는 싫었음일까? 김첨지는 마음이 눈이 아니로되, 이렇게 앉은 말았다.
      </p>},
  image_url: 'alex.jpg',)
  .products.create!([
    {
      title_en: 'Red Tee',
      title_kr: '티셔츠', 
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url:   'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    },
    {
      title_en: 'Hat',
      title_kr: '모자',
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url: 'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    },
    {
      title_en: 'Shoe',
      title_kr: '신발',
      description_en: 
      %{<p>
         Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed 
         do eiusmod tempor incididunt ut labore et dolore magna aliqua.
         Ut enim ad minim veniam, quis nostrud exercitation ullamco 
         laboris nisi ut aliquip ex ea commodo consequat.
        </p>},
      description_kr: 
      %{<p>
        만들어 무료 돈 왈칵 치삼은 힘차게 못해. 아씨 우스운 힘차게 남대문 믿음을 초조한 
        없지만 광명이 몰리었다. 비를 차장에게 떡 놓칠 찔렀다. 피가 서 부분까지 먹지를 하단의 
        눈을 거의 도는지 먹었네. 가세, 벌써 년 있음이다. 매우 비는 만능으로 팔을 오십 귀찮게. 
        젖 돌아서더니만 집이라 환자의 그 생의 원수엣 이의 날이었다. 많은 만들어도 이놈.
        </p>},
      image_url: 'shoe.jpg',    
      price: 36000,
      minbuy: 10,
      end_date: DateTime.strptime("07/14/2014 7:30", "%m/%d/%Y %H:%M"),
    }
])

