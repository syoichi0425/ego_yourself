class EgogramsController < ApplicationController
  before_action :authenticate_user!

  before_action :ego_result_params,only: [:index,:result]
  before_action :ego_result_to_page_params,only: [:index,:result]


  def new
    @test=EgogramScore.new

  end

  def index
    #ここにエゴグラムを解答して保存したモデルとカラムの一覧を表示
    #EgogramNpQuetionは仮で置いてるだけ
    #@index=EgoScore.all
#EgoScore.where(user_id: current_user.id)でEgoScoreのuser_idカラムを
#ログインユーザーのuser_idだけを絞っている
#index=EgoScore.where(user_id: current_user.id).last



#cp=index.pluck(:cp_score).last
#np=index.pluck(:np_score).last
  #  @iindex=EgoScore.where(user_id: current_user.id).last


#  User.where(id: [1,2,3]).pluck(:id, :name)

#@index=index.np_score

#@cp=index.pluck(:cp_score)
#@np=index.pluck(:cp_score).last
#@a=index.pluck(:cp_score).last
#@fc=index.pluck(:cp_score).last
#@ac=index.pluck(:cp_score).last


# cp=EgoScore.pluck(:cp_score).last
# np=EgoScore.pluck(:np_score).last

# #最新のResult_idを読み込んで
# #カラムcp~acの5つを呼び出し
# # cp=newest_result_id(:cp_score).to_i
# # np=newest_result_id(:np_score).to_i
# # a=newest_result_id(:a_score).to_i
# # fc=newest_result_id(:fc_score).to_i
# # ac=newest_result_id(:ac_score).to_i

# # #ifの各条件に分けてresultテーブルのidを決定する
#  if cp<4 && np<5
#   @result=TestResult.where(id: 1)
# # elsif cp<10 && np>10
# #  elsif cp<3 && np>3
# #   @result=TestResult.where(id: 2)
# #    #&& np<10 && a<10 && fc<10 && ac<10
# # # #ifで決定したidをResultのidに代入し、result.htmlに値を渡す
#   else
#    @result=TestResult.where(id: 2)

#  end


   # @history=EgogramNpQuetion.where(user_id: current_user.id)
  end

  def test
    @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i
    @np_total=params[:q_np1].to_i+params[:q_np2].to_i
    @a_total=params[:q_a1].to_i+params[:q_a2].to_i
    @fc_total=params[:q_fc1].to_i+params[:q_fc2].to_i
    @ac_total=params[:q_ac1].to_i+params[:q_ac2].to_i
    #params[:オブジェクト名(テーブルのカラム名など)]


  end


def test2
  ego=EgoScore.where(user_id: current_user.id)
  @a=ego
end



  def create

    @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i

    @np_total=params[:q_np1].to_i+params[:q_np2].to_i
    @a_total=params[:q_a1].to_i+params[:q_a2].to_i
    @fc_total=params[:q_fc1].to_i+params[:q_fc2].to_i
    @ac_total=params[:q_ac1].to_i+params[:q_ac2].to_i

#@egoscore=[@cp_total,@cp_total,@cp_total,@cp_total,@cp_total,]


    #各params合計値
#    createメソッドに渡す引数のデータ
#   モデル名.create({ カラム名: 値 })

#    EgoScore.create
#createメソッドは、newとsaveを同時に行っているメソッド
#=生成したインスタンスを使って何かしらの操作を行いたい場合には、createメソッドは使用できない
#そのため、newメソッドとsaveメソッドで操作する
  @ego_score=EgoScore.new(

          cp_score: @cp_total,
          np_score: @np_total,
          a_score: @a_total,
          fc_score: @fc_total,
          ac_score: @ac_total,
          user_id: current_user.id)

if  @ego_score.save
  redirect_to egograms_result_path,notice: "保存しました"
#redirect_to 〇〇_pathを使って診断結果のページに飛ぶのとその診断の数値をresultテーブルの値と比較してページの生成を行なってそれを画面に表示する
else
  render :test ,notice: "失敗しました"
    end
  end
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

def show

end

  def result
#EgoScoreの最新(＝最後に保存したego_score_id)の(https://teratail.com/questions/143372)
#newest_result=EgoScore.last(1)
#cp_score=newest_result.cp_score
#cp=cp_score.to_i
#(user_id: current_user.id)


# unless EgoScore(params[user_session])==current_user
#   redirecto_to root_path
# end

#@profile = EgoScore.find_by(user_id: params[:user_id])

#モデル名.pluck(:カラム名)  全てのデータではなく特定のカラムの値だけ取得
index=EgoScore.where(user_id: current_user.id)
cp=index.pluck(:cp_score).last
np=index.pluck(:np_score).last

#最新のResult_idを読み込んで
#カラムcp~acの5つを呼び出し
# cp=newest_result_id(:cp_score).to_i
# np=newest_result_id(:np_score).to_i
# a=newest_result_id(:a_score).to_i
# fc=newest_result_id(:fc_score).to_i
# ac=newest_result_id(:ac_score).to_i

# #ifの各条件に分けてresultテーブルのidを決定する
 if cp<4 && np<5
  @result=TestResult.where(id: 1)
# elsif cp<10 && np>10
#  elsif cp<3 && np>3
#   @result=TestResult.where(id: 2)
#    #&& np<10 && a<10 && fc<10 && ac<10
# # #ifで決定したidをResultのidに代入し、result.htmlに値を渡す
  else
   @result=TestResult.where(id: 2)

 end

    @egogram_type= "#ここに〇〇型、「××」タイプが入る"
      #結果のモデルのtypeカラム
    @user_name="#「ここにユーザー名」"
      #User.namefind(params[:id])
    @character="基本の性格"
      #結果のモデルのcharacterカラム
      #
    @strength="#ここに各結果に基づいた[長所]の文言が入る"
      #結果のモデルのstrengthカラム
    @weakness="#ここに各結果に基づいた[短所]の文言が入る"
      #結果のモデルのweaknessカラム
    @think_about="#ここに各結果に基づいた[思っていること]の文言が入る"
      #結果のモデルのthink_aboutカラム
    @people_around_youとは="#ここに各結果に基づいた[周りから見たあなた]の文言が入る"
      #結果のモデルのpeople_around_youカラム
  end
    #@test=EgogramCpQuetion.new
    #@test_cp=EgogramCpQuetion.select("title")
    #@test_np=EgogramNpQuetion.select("title")




  def confirmation
  end
end

private

def ego_result_params
  egoscore=EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score,:np_score,:a_score,:fc_score,:ac_score).flatten

  @cp=egoscore[0]
  @np=egoscore[1]
  @a=egoscore[2]
  @fc=egoscore[3]
  @ac=egoscore[4]

end

def ego_result_to_page_params

  #if cp<4 && np<4 && a<4 && fc<4 && ac<4
  if @cp>=0 && @np>=0 && @a>=0 && @fc>=0 && @ac>=0
    @result=TestResult.where(id: 1)
  # elsif cp<10 && np>10
  #  elsif cp<3 && np>3
  #   @result=TestResult.where(id: 2)
  #    #&& np<10 && a<10 && fc<10 && ac<10
  # # #ifで決定したidをResultのidに代入し、result.htmlに値を渡す
    else
     @result=TestResult.where(id: 2)

   end
end


def ego_score_params
  params.require(:ego_score).permit(:cp_score,:np_score,:a_score,:fc_score,:ac_score).merge(user_id: current_user.id)
#params.require(:使用するモデル名).permit(:使用するカラム名)
end

