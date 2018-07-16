class HomeController < ApplicationController
  def keyboard_init
    msg = {
      type: "buttons",
      buttons: ["입력","보기"]
    }
    render json: msg, status: :ok
  end
   
  def keyboard_control
    @received_data = JSON.parse(request.raw_post)
    content = @received_data["content"]
    # @content=params[:content]
    
    if content == "입력"
      msg = {
        message: {
          text: "내용을 입력하세요(돌아가기 => 'ㅇㅇ'입력)"
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
          buttons: ["입력","보기"]
        }
      }
      render json: msg, status: :ok
      
      elsif content == "보기"
      dddd=Post.all
      vv=Post.count
      gg = "--------------------------------\n최근 글 5개 입니다.\n--------------------------------\n" +"1. "+ dddd.last.content + "\n\n" +"2. "+ dddd.find(vv-1).content + "\n\n" +"3. "+ dddd.find(vv-2).content+ "\n\n" +"4. "+ dddd.find(vv-3).content + "\n\n" +"5. "+ dddd.find(vv-4).content
      
      msg = {
        message: {
          text: gg,
          message_button: {
            label: "전체보기",
            url:"https://dingco-hackerton-suboklee.c9users.io/"}
        },
        keyboard: {
          type: "buttons",
          buttons: ["입력","보기"]
        }
      }
      render json: msg, status: :ok      
      
      
      
      
      
    else 
      if @received_data["content"].length < 150
      a=Post.new
      a.content=@received_data["content"]
      a.save
      
      
      msg = {
        message: {
          text: "저장되었습니다."
        },
        keyboard: {
          type: "text"
        }
      }
      render json: msg, status: :ok
      else
        msg = {
          message: {
            text: "150자를 넘으면 안됩니다."
          },
          keyboard: {
            type: "text"
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
