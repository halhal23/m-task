class SamplesController < ApplicationController
  def hello
    @comment = "hello world and halhal"
  end

  
  def lesson1
    flash[:hoge] = "This is #{params[:name]}"
    redirect_to action: "lesson2"
  end
  
  def lesson2
    render plain: flash[:hoge]
  end

  def lesson3
    flash.now[:test] = "happy and happiness"
    render plain: flash[:test]
  end

  def lesson4
    render plain: "console.log(#{flash[:notice]})"
  end

  def lesson5
    @date = Time.current
    @message = "明けましておめでとう。\nこれからもよろしくね。"
  end
end
