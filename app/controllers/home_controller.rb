class HomeController < ApplicationController
  def keyboard_init
    msg = {
      type: "buttons",
      buttons: ["사용방법","입력"]
    }
    render json: msg, status: :ok
  end
   
  def keyboard_control
    @received_data = JSON.parse(request.raw_post)
    content = @received_data["content"]
    # @content=params[:content]
    

      
    if content == "입력"
      dddd=Post.all
      vv=Post.count
      # gg = "--------------------------------\n내용을 입력하세요\n(처음으로 ='ㅇㅇ'입력)\n--------------------------------\n" +"- "+ dddd.last.content + "\n\n" +"- "+ dddd.find(vv-1).content + "\n\n" +"- "+ dddd.find(vv-2).content+ "\n\n" +"- "+ dddd.find(vv-3).content + "\n\n" +"- "+ dddd.find(vv-4).content
      gg = "hi"
      msg = {
        message: {
          text: gg
        },
        keyboard: {
          type: "text"
        }
      }
      render json: msg, status: :ok      
      
      
      elsif content == "ㅇㅇ"
      msg = {
        message: {
          text: "돌아가기"
        },
        keyboard: {
          type: "buttons",
          buttons: ["사용방법","입력"]
        }
      }
      render json: msg, status: :ok
      
      elsif content == "사용방법"

      msg = {
        message: {
          text: "'입력'을 선택한뒤 원하는 내용을 입력하시면 저장됩니다.(최대 500자)\n처음으로 돌아갈때는 'ㅇㅇ'을 입력해주세요.",
                          photo: {
                          url: "http://k.kakaocdn.net/dn/dgH4dE/btqnpgNltOo/hLX0UBeuAEmaBxkAOnBnsk/img_xl.jpg",
                          width: 720,
                          height: 730},
                          
          message_button: {
            label: "자세한 사용방법",
            url:"http://pf.kakao.com/_faiYC/23428244"}
        },
        keyboard: {
          type: "buttons",
          buttons: ["사용방법","입력"]
        }
      }
      render json: msg, status: :ok      
      

    else 
          if @received_data["content"].length < 500
          a=Post.new
          a.content=@received_data["content"]
          a.save
          
      dddd=Post.all
      vv=Post.count
      # gg = "--------------------------------\n저장되었습니다.\n--------------------------------\n" +"- "+ dddd.last.content + "\n\n" +"- "+ dddd.find(vv-1).content + "\n\n" +"- "+ dddd.find(vv-2).content+ "\n\n" +"- "+ dddd.find(vv-3).content + "\n\n" +"- "+ dddd.find(vv-4).content
      gg = "hi"  
          msg = {
            message: {
              text: gg,
              message_button: {
                label: "전체보기",
                url:"http://13.209.5.223"}
            },
            keyboard: {
              type: "text"
            }
          }
          render json: msg, status: :ok 
          
          
          
          
          else
          dddd=Post.all
          vv=Post.count
          # gg = "--------------------------------\n500자를 넘을 수 없습니다.\n--------------------------------\n" +"- "+ dddd.last.content + "\n\n" +"- "+ dddd.find(vv-1).content + "\n\n" +"- "+ dddd.find(vv-2).content+ "\n\n" +"- "+ dddd.find(vv-3).content + "\n\n" +"- "+ dddd.find(vv-4).content
          gg = "hi"
          msg = {
            message: {
              text: gg,
              message_button: {
                label: "전체보기",
                url:"http://13.209.5.223"}
            },
            keyboard: {
              type: "text",
            }
          }
          render json: msg, status: :ok   
          end
    end   #if else end
  end      #keyboard_int end
  
  
  def index
    @asdf=Post.all
    @cc=Post.count
  end
  
end   #컨트롤러
