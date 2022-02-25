class EgogramsController < ApplicationController
  def new
    @test = EgogramCpQuetion.new
  end

  def test
    @total_cp=params[:q_cp1].to_i+params[:q_cp2].to_i
    @total_np=params[:q_np1].to_i+params[:q_np2].to_i

    #params[:オブジェクト名(テーブルのカラム名など)]


  end


  def create
    @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i
    @np_total=params[:q_np1].to_i+params[:q_np2].to_i
    #各params合計値
#    createメソッドに渡す引数のデータ -->
#   モデル名.create({ カラム名: 値 })

    @cp = EgogramCpQuetion.create(title: @cp_total)
    @np = EgogramNpQuetion.create(title: @np_total)
    #↓次作るイメージ2022/02/23
    #@total_sum = EgogramtotalResult.create(cp_total: @cp_total,np_total: @np_total)




    #  if @cp.save
    #     flash[:success] = "Object successfully created"
    # render "result"
        #  ここでやりたいこと
          #解答後の画面移行時は、一番最新のEgo_resultモデル(仮)のEgo_result_idを呼び出す
          #最新のEgo_result_idに紐づけた
          #結果の各点数に応じたEgo_resultモデル(仮)の該当するカラムや実際に解答点数(CP~FCの5項目)を呼び出す
          #呼び出した各数値を折線グラフに反映
          #これらのパラメータを保持してegogram/result.html.erbに飛んで画面表示
    #  else
    # flash[:error] = "Something went wrong"
    # render 'new'
    #end
  end

  def result
  #
    @egogram_type= "#ここに〇〇型、「××」タイプが入る"
      #結果のモデルのtypeカラム
    @user_name="#「ここにユーザー名」"
      #User.namefind(params[:id])
    @seikaku="基本の性格"
      #結果のモデルのseikakuカラム
      #
    @strengths="#ここに各結果に基づいた[長所]の文言が入る"
      #結果のモデルのstrengthsカラム
    @weakness="#ここに各結果に基づいた[短所]の文言が入る"
      #結果のモデルのweaknessカラム
    @always_thinking="#ここに各結果に基づいた[思っていること]の文言が入る"
      #結果のモデルのalways_thinkingカラム
    @your_around="#ここに各結果に基づいた[周りから見たあなた]の文言が入る"
      #結果のモデルのyour_aroundカラム
  end
    #@test=EgogramCpQuetion.new
    #@test_cp=EgogramCpQuetion.select("title")
    #@test_np=EgogramNpQuetion.select("title")

  def history_list
    #ここにエゴグラムを解答して保存したモデルとカラムの一覧を表示
    #EgogramNpQuetionは仮で置いてるだけ
    @history=EgogramNpQuetion.all
   # @history=EgogramNpQuetion.where(user_id: current_user.id)
  end


  def confirmation
  end
end

private

def test_params
  params.require(:egogram_cp_quetion).permit(:title)
#params.require(:使用するモデル名).permit(:使用するカラム名)
end
