class EgogramsController < ApplicationController
  before_action :authenticate_user!
  before_action :ego_quetions_create_params,only: [:create]
  before_action :ego_result_params,only: [:index,:result]
  before_action :ego_result_to_page_params,only: [:index,:result]


  def new
    @test=EgogramScore.new

  end

  def index
#未実装：ここにエゴグラムを解答して保存したモデルとカラムの一覧を表示
#@index=EgoScore.all
#EgoScore.where(user_id: current_user.id)でEgoScoreのuser_idカラムを
#ログインユーザーのuser_idだけを絞っている
#index=EgoScore.where(user_id: current_user.id).last

   # @history=EgogramNpQuetion.where(user_id: current_user.id)
  end

  def test

    @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i
    @np_total=params[:q_np1].to_i+params[:q_np2].to_i
    @a_total=params[:q_a1].to_i+params[:q_a2].to_i
    @fc_total=params[:q_fc1].to_i+params[:q_fc2].to_i
    @ac_total=params[:q_ac1].to_i+params[:q_ac2].to_i

  end


def test2
  ego=EgoScore.where(user_id: current_user.id)
  @a=ego
end

#--------------createについて----------------
#createメソッドは、newとsaveを同時に行っているメソッド
#=生成したインスタンスを使って何かしらの操作を行いたい場合には、createメソッドは使用できない
#そのため、newメソッドとsaveメソッドで操作する
#--------------createについて----------------
def create
#createアクション:egograms/test.html.erbのラジオボタンのparametersを取得して各合計点数を出して、EgoScoreテーブルの各カラムに保存
#createメソッドに渡す引数の書き方 => モデル名.create({ カラム名: 値 })
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
  # flash[:error] = "Something went wrong"
    render :test ,notice: "失敗しました"
  end
end


def show

end

  def result
#モデル名.pluck(:カラム名)  全てのデータではなく特定のカラムの値だけ取得
#EgoScoreの最新を取得している(＝最後に保存したego_score_id)の(https://teratail.com/questions/143372)

    @egogram_type= "#ここに〇〇型、「××」タイプが入る"
      #結果のモデルのtypeカラム
    @user_name="#「ここにユーザー名」"
      #User.namefind(params[:id])
    @character="#基本の性格"
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

  def confirmation
  end
end




private

def ego_quetions_create_params  #ラジオボタンで取得した各paramsの合計値を出すアクション(createアクションで主に使用予定)
    #params[:オブジェクト名(テーブルのカラム名など)]
  @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i
  @np_total=params[:q_np1].to_i+params[:q_np2].to_i
  @a_total=params[:q_a1].to_i+params[:q_a2].to_i
  @fc_total=params[:q_fc1].to_i+params[:q_fc2].to_i
  @ac_total=params[:q_ac1].to_i+params[:q_ac2].to_i
end


def ego_result_params #EgoScoreから最新の各カラムの値を取得するアクション

# 未実装:ログインユーザーid(user_id)とegoscoreのuser_idが同じかどうかで本人か識別
# unless EgoScore(params[user_session])==current_user
#   redirecto_to root_path
# end

  egoscore=EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score,:np_score,:a_score,:fc_score,:ac_score).flatten

  @cp=egoscore[0]
  @np=egoscore[1]
  @a=egoscore[2]
  @fc=egoscore[3]
  @ac=egoscore[4]

end

def ego_result_to_page_params　#def ego_result_paramsと組み合わせるアクションで、EgoScoreから最新の各カラムの値を取得するアクション

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

#ストロングパラメータ(セキュリティ) https://qiita.com/morikuma709/items/2dc20d922409ae7ce216
#書き方=>params.require(:使用するモデル名).permit(:使用するカラム名)
def ego_score_params
  params.require(:ego_score).permit(:cp_score,:np_score,:a_score,:fc_score,:ac_score).merge(user_id: current_user.id)

end