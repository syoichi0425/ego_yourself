class OtameshisController < ApplicationController
  def new
    @egogram = Egogram.new
  end


def otameshi
  
end


  def cp_test
    @cp_test=Cp_test.new
  end

  def

    def test
      @q_cp1=params[:q_cp1]
#params[:テーブルのカラム名]

  if value==yes
    @q_cp1=2
  elsif value==noither
    @q_cp1=1
  else
    @q_cp1=0
  end


end

def create
  @object = Object.new(params[:object])
  if @object.save
    flash[:success] = "Object successfully created"
    redirect_to @object
  else
    flash[:error] = "Something went wrong"
    render 'new'
  end
end



  def create
    @egogram = Egogram.new()
    if @egogram.save
      flash[:success] = "Object successfully created"
      redirect_to @egogram
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end



  def test


    @test=EgogramCpQuetion.new
    @test_cp=EgogramCpQuetion.select("title")
    @test_np=EgogramNpQuetion.select("title")

  end

  def result
  end

  def confirmation
  end
end

private


