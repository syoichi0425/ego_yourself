class EgogramsController < ApplicationController
  protect_from_forgery except: [:destroy]
  before_action :authenticate_user!
  before_action :ego_quetions_toatl_params, only: %i[test create]
  before_action :ego_result_params, only: [:result]
  #  before_action :ego_result_index,only: [:index]
  #  before_action :ego_result_create_to_page,only: [:result]

  def new
    @test = EgoScore.new
    # @test_result=TestResult.all
    @test_result = TestResult.page(params[:page]).per(3)
  end

  def index
    # 未実装：ここにエゴグラムを解答して保存したモデルとカラムの一覧を表示
    # @index=EgoScore.where(user_id: current_user.id)
    if EgoScore.where(user_id: current_user.id).present?
      index = EgoScore.where(user_id: current_user.id)
      @index = Kaminari.paginate_array(index).page(params[:page]).per(10)
    else
      flash[:alert] = 'はじめにエゴグラム診断を行なってください'
      redirect_to("/contents")
    end


    # @index2=EgoScore.page(params[:page]).per(3)
    # EgoScore.where(user_id: current_user.id)でEgoScoreのuser_idカラムを
    # ログインユーザーのuser_idだけを絞っている
    # index=EgoScore.where(user_id: current_user.id).last

    # render layout: "egogram_index"
  end

  def show
    # TestResult.find(params[:id])
    # result.html.erbと同じlayoutを使用する

    # EgoScore.where(user_id: current_user.id).last.test_result_id
    @result = params[:id]
    @cp = params[:cp_l]
    @np = params[:np_l]
    @a = params[:a_l]
    @fc = params[:fc_l]
    @ac = params[:ac_l]

    render :result
  end

  def edit
    @edit = TestResult.find(params[:id])
  end

  # @history=EgogramNpQuetion.where(user_id: current_user.id)

  def update
    @edit = TestResult.find(params[:id])
    if @edit.update(test_result_params)
      flash[:success] = '保存に成功しました'
      redirect_to egograms_new_path
    else
      flash.now[:alert] = '保存に失敗しました'
      render 'new'
    end
  end

  def destroy
    ego_score = EgoScore.find(params[:id])
    if ego_score.user_id == current_user.id
      ego_score.destroy
      flash.now[:success] = '削除しました'
      # redirect_to "index"
      redirect_to action: :index
    else
      flash.now[:alert] = '削除に失敗しました'
      render 'index'
    end
  end

  def test # ここでラジオボタンのparameterを一つずつ取得し、合計するアクション
    @number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    @cp = ['何事もきちっとしなければ気が済まない',
           '人が間違ったことをした時は、なかなか許せない',
           '自分は責任感が強い',
           '自分の考えは譲らず、最後まで通す',
           '礼儀作法の厳しい躾を受けた',
           '小さな不正でもうやむやにしない',
           '権利を主張する前に義務を果たす',
           '「〜せねばならない」「〜すべきだ」という言い方をよくする',
           '規則は守る方で、時間やお金にルーズなことは嫌だ',
           '子供や部下は厳しく教育する']

    @np = ['道を聞かれたら親切に教えてあげる',
           '相手の話に耳を傾け、共感することがある',
           '他人の世話をすることが好きだ',
           '人の悪いところよりも、いいところを見るようにする',
           'がっかりしている人がいたら、慰めたり元気づけてあげる',
           '自分は融通が聞く方だと思う',
           '人から何か頼まれたら嫌と言えない',
           '誰かが失敗した時、責めないで許してあげる',
           '社会奉仕的な仕事に参加することが好きだ',
           '義理と人情を重視する']

    @a = ['人の意見は賛否両論を聞いて参考にする',
          '何かうまくいかない時でもあまりカッとならない',
          '何か決める時、いろいろな人の意見を聞いて参考にする',
          '初めて何かするときは、よく調べてからする',
          '何かするとき、自分にとって得か損かよく考える',
          '何かわからないことがあると、人に聞いたり相談する',
          '体調不良の時は、自重して無理しないようにする',
          '両親や友達、上司などと冷静によく話し合うことがある',
          '能率的にテキパキと仕事を片付ける',
          '情緒的というより、論理的だ']

    @fc = ['おしゃれが好きだ',
           'みんなと騒いだりはしゃいだりして遊ぶのが好きだ',
           '言いたいことを遠慮なく言う',
           '嬉しいときや悲しい時は表情や動作に表す',
           '欲しいものは手に入れないと気が済まない',
           '異性に自由に話しかけることができる',
           '人に冗談を言ったり、からかったりするのが好きだ',
           'スポーツやダンス、歌を歌ったりするのが大好きだ',
           '直感で判断することが多い',
           '好奇心が強い']

    @ac = ['人の顔色や言うことが気にかかるところがある',
           '嫌なことを嫌と言えず、抑えてしまうことが多い',
           '劣等感が強い',
           '何か頼まれると、すぐにやらず引き伸ばす癖がある',
           '人からよく思われたいと思う',
           '本当の自分の考えよりも、人の言うことに影響されることがある',
           '悲しみや憂鬱な気持ちになることがよくある',
           '遠慮がちで少し消極的になることがある',
           '思っていることを口に出せない方だ',
           '「自分らいしい自分」「本当の自分」とは離れている気がする']
  end

  def test2
    ego = EgoScore.where(user_id: current_user.id)
    @a = ego
  end

  #--------------createについて----------------
  # createメソッドは、newとsaveを同時に行っているメソッド
  #=生成したインスタンスを使って何かしらの操作を行いたい場合には、createメソッドは使用できない
  # そのため、newメソッドとsaveメソッドで操作する
  #--------------createについて----------------

  def create
    # createアクション:testアクションで取得した各合計点数をEgoScoreテーブルの各カラムに保存
    # createメソッドに渡す引数の書き方 => モデル名.create({ カラム名: 値 })
    # @cp=egoscore[0]
    # @np=egoscore[1]
    # @a=egoscore[2]
    # @fc=egoscore[3]
    # @ac=egoscore[4]

    result_id = 0

    # ネガティブ
    if @cp_total >= 11 && @np_total <= 9 && @a_total >= 11 && @fc_total <= 9 && @ac_total >= 11
      result_id = 1

      # 楽天家
    elsif @cp_total <= @np_total - 2 && @np_total >= 14 && @a_total <= @np_total - 2 && @fc_total >= 14 && @ac_total <= @np_total - 2
      result_id = 2

      # 献身
    elsif @cp_total <= @np_total - 2 && @np_total >= 14 && @a_total <= @np_total - 2 && @fc_total <= @np_total - 2 && @ac_total >= 10
      result_id = 3

      # 野心家
    elsif @cp_total >= 10 && @np_total < @cp_total - 2 && @a_total <= @np_total && @fc_total >= 10 && @ac_total < @cp_total - 2
      result_id = 4

      # 合理的
    elsif @cp_total <= 6 && @np_total >= 6 && @np_total <= 10 && @a_total >= 11 && @fc_total >= 6 && @fc_total <= 10 && @ac_total <= 6
      result_id = 5

      # 生真面目
    elsif @cp_total >= 12 && @np_total <= 5 && @np_total <= 11 && @a_total <= 4 && @fc_total >= 5 && @fc_total <= 11 && @ac_total >= 12
      result_id = 6

      # ネガティブ
    elsif @cp_total >= 18 && @np_total <= 6 && @a_total <= 6 && @fc_total <= 6 && @ac_total >= 18
      result_id = 7

      # 天真爛漫
    elsif @cp_total <= 12 && @np_total >= 16 && @a_total >= 12 && @a_total <= 16 && @fc_total >= 16 && @ac_total <= 12
      result_id = 8

      # 駄々っ子
    elsif @cp_total <= @a_total && @np_total <= @a_total && @a_total < @ac_total && @fc_total > @ac_total && @ac_total >= 10
      result_id = 10

      # パーフェクト
    elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
      result_id = 11

    # 頑固
    elsif @cp_total >= 16 && @np_total <= @cp_total && @a_total <= @np_total && @fc_total <= @a_total && @ac_total <= @fc_total
      result_id = 9

      # 平凡
    elsif @cp_total >= 8 && @cp_total <= 13 && @np_total >= 8 && @np_total <= 13 && @a_total >= 8 && @a_total <= 13 && @fc_total >= 8 && @fc_total <= 13 && @ac_total >= 8 && @ac_total <= 13
      result_id = 12

      # 無欲
    elsif @cp_total <= 8 && @np_total <= 8 && @a_total <= 8 && @fc_total <= 8 && @ac_total <= 8
      result_id = 13

      # お気楽ルーズ
    elsif @cp_total <= 7 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
      result_id = 14

      # クール
    elsif @cp_total >= 14 && @np_total <= 7 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
      result_id = 15

      # 直感行動
    elsif @cp_total >= 14 && @np_total >= 14 && @a_total <= 7 && @fc_total >= 14 && @ac_total >= 14
      result_id = 16

      # 心を閉じる
    elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total <= 7 && @ac_total >= 14
      result_id = 17

      # 熱血
    elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total <= 7
      result_id = 18

      # 堅実
    elsif @cp_total >= 16 && @np_total >= 7 && @np_total <= 14 && @a_total >= 7 && @a_total <= 14 && @fc_total >= 7 && @fc_total <= 14 && @ac_total >= 7 && @ac_total <= 14
      result_id = 19

      # お人好し
    elsif @cp_total >= 6 && @cp_total <= 14 && @np_total >= 15 && @a_total >= 6 && @a_total <= 14 && @fc_total >= 6 && @fc_total <= 14 && @ac_total >= 6 && @ac_total <= 14
      result_id = 20

      # 理屈
    elsif @cp_total >= 7 && @cp_total <= 14 && @np_total >= 7 && @np_total <= 14 && @a_total >= 15 && @fc_total >= 7 && @fc_total <= 14 && @ac_total >= 7 && @ac_total <= 14
      result_id = 21

      # 自由奔放
    elsif @cp_total >= 6 && @cp_total <= 14 && @np_total >= 6 && @np_total <= 14 && @a_total >= 6 && @a_total <= 14 && @fc_total >= 15 && @ac_total >= 6 && @ac_total <= 14
      result_id = 22

      # 繊細
    elsif @cp_total >= 4 && @cp_total <= 14 && @np_total >= 4 && @np_total <= 14 && @a_total >= 4 && @a_total <= 14 && @fc_total >= 4 && @fc_total <= 14 && @ac_total >= 15
      result_id = 23

      # elsif @cp_total && @np_total && @a_total && @fc_total && @ac_total
      #   result_id=

    else
      # render :test ,notice: "該当しませんでした"
      result_id = 24

    end

    @result_id = result_id

    @ego_score = EgoScore.new(
      cp_score: @cp_total,
      np_score: @np_total,
      a_score: @a_total,
      fc_score: @fc_total,
      ac_score: @ac_total,
      test_result_id: @result_id,
      user_id: current_user.id
    )

    if @ego_score.save
      # @ego_scoreの全ての中身を保存
      redirect_to egograms_result_path, notice: '保存しました' # 試験的実験：redirect_to egograms_index_path,notice: "保存しました"
    # redirect_to 〇〇_pathを使って診断結果のページに飛ぶのとその診断の数値をresultテーブルの値と比較してページの生成を行なってそれを画面に表示する
    else
      # flash[:error] = "Something went wrong"
      render :test, notice: '失敗しました'
    end

    #  egoscore=EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score,:np_score,:a_score,:fc_score,:ac_score).flatten
  end

  def result
    # EgoScoreの最新を取得している(＝最後に保存したego_score_id)の(https://teratail.com/questions/143372)
    if EgoScore.where(user_id: current_user.id).present?
      @result = EgoScore.where(user_id: current_user.id).last.test_result_id
    else
      flash[:alert] = 'はじめにエゴグラム診断を行なってください'
      redirect_to("/contents")
    end
  end

  def confirmation; end
end

private

def ego_quetions_toatl_params # ラジオボタンで取得した各paramsの合計値を出すアクション(testアクションとcreateアクションで主に使用予定)
  # params[:オブジェクト名(テーブルのカラム名など)]
  number = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
  cp = 0
  np = 0
  a = 0
  fc = 0
  ac = 0
  number.each do |i|
    cp += params[:"q_cp#{i}"].to_i
  end

  number.each do |i|
    np += params[:"q_np#{i}"].to_i
  end

  number.each do |i|
    a += params[:"q_a#{i}"].to_i
  end

  number.each do |i|
    fc += params[:"q_fc#{i}"].to_i
  end

  number.each do |i|
    ac += params[:"q_ac#{i}"].to_i
  end

  @cp_total = cp
  @np_total = np
  @a_total = a
  @fc_total = fc
  @ac_total = ac

  # @cp_total=params[:q_cp1].to_i+params[:q_cp2].to_i
  # @np_total=params[:q_np1].to_i+params[:q_np2].to_i
  # @a_total=params[:q_a1].to_i+params[:q_a2].to_i
  # @fc_total=params[:q_fc1].to_i+params[:q_fc2].to_i
  # @ac_total=params[:q_ac1].to_i+params[:q_ac2].to_i
  # test.html.erbにあるsubmitを押したらcreateアクションが発動
end

def ego_result_params # 診断結果の各合計値のカラム値最新を取得=>EgoScoreから最新の各カラムの値を取得するアクション
  # 未実装:ログインユーザーid(user_id)とegoscoreのuser_idが同じかどうかで本人か識別
  # unless EgoScore(params[user_session])==current_user
  #   redirect_to root_path

  # end

  egoscore = EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score, :np_score,
                                                                                              :a_score, :fc_score, :ac_score).flatten
  # モデル名.pluck(:カラム名)  全てのデータではなく特定のカラムの値だけ取得

  @cp = egoscore[0]
  @np = egoscore[1]
  @a = egoscore[2]
  @fc = egoscore[3]
  @ac = egoscore[4]
end

def ego_result_index # 未実装：診断結果の一覧=>診断結果の各合計値の全てのカラム値を取得
  @egoscore = EgoScore.where(user_id: current_user.id).all
  # @egoscore.each do |i|
  #   @cp1=i.cp_score.to_i
  #   @np1=i.np_score.to_i
  #   @a1=i.a_score.to_i
  #   @fc1=i.fc_score.to_i
  #   @ac1=i.ac_score.to_i

  # end
end

def ego_result_create_to_page # 保存されている診断結果から条件分岐でページを作成=>def ego_result_paramsなどと組み合わせるアクションで、EgoScoreから最新の各カラムの値を取得するアクション
  # ネガティブ
  if @cp_total >= 11 && @np_total <= 9 && @a_total >= 11 && @fc_total <= 9 && @ac_total >= 11
    @result_id = 1

    # 楽天家
  elsif @cp_total <= @np_total - 2 && @np_total >= 14 && @a_total <= @np_total - 2 && @fc_total >= 14 && @ac_total <= @np_total - 2
    @result_id = 2

    # 献身
  elsif @cp_total <= @np_total - 2 && @np_total >= 14 && @a_total <= @np_total - 2 && @fc_total <= @np_total - 2 && @ac_total >= 10
    @result_id = 3

    # 野心家
  elsif @cp_total >= 10 && @np_total < @cp_total - 2 && @a_total <= @np_total && @fc_total >= 10 && @ac_total < @cp_total - 2
    @result_id = 4

    # 合理的
  elsif @cp_total <= 6 && @np_total >= 6 && @np_total <= 10 && @a_total >= 11 && @fc_total >= 6 && @fc_total <= 10 && @ac_total <= 6
    @result_id = 5

    # 生真面目
  elsif @cp_total >= 12 && @np_total <= 5 && @np_total <= 11 && @a_total <= 4 && @fc_total >= 5 && @fc_total <= 11 && @ac_total >= 12
    @result_id = 6

    # ネガティブ
  elsif @cp_total >= 18 && @np_total <= 6 && @a_total <= 6 && @fc_total <= 6 && @ac_total >= 18
    @result_id = 7

    # 天真爛漫
  elsif @cp_total <= 12 && @np_total >= 16 && @a_total >= 12 && @a_total <= 16 && @fc_total >= 16 && @ac_total <= 12
    @result_id = 8

    # 頑固
  elsif @cp_total >= 16 && @np_total <= @cp_total && @a_total <= @np_total && @fc_total <= @a_total && @ac_total <= @fc_total
    @result_id = 9

    # 駄々っ子
  elsif @cp_total <= @a_total && @np_total <= @a_total && @a_total < @ac_total && @fc_total > @ac_total && @ac_total >= 10
    @result_id = 10

    # パーフェクト
  elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
    @result_id = 11

    # 平凡
  elsif @cp_total >= 8 && @cp_total <= 13 && @np_total >= 8 && @np_total <= 13 && @a_total >= 8 && @a_total <= 13 && @fc_total >= 8 && @fc_total <= 13 && @ac_total >= 8 && @ac_total <= 13
    @result_id = 12

    # 無欲
  elsif @cp_total <= 8 && @np_total <= 8 && @a_total <= 8 && @fc_total <= 8 && @ac_total <= 8
    @result_id = 13

    # お気楽ルーズ
  elsif @cp_total <= 7 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
    @result_id = 14

    # クール
  elsif @cp_total >= 14 && @np_total <= 7 && @a_total >= 14 && @fc_total >= 14 && @ac_total >= 14
    @result_id = 15

    # 直感行動
  elsif @cp_total >= 14 && @np_total >= 14 && @a_total <= 7 && @fc_total >= 14 && @ac_total >= 14
    @result_id = 16

    # 心を閉じる
  elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total <= 7 && @ac_total >= 14
    @result_id = 17

    # 熱血
  elsif @cp_total >= 14 && @np_total >= 14 && @a_total >= 14 && @fc_total >= 14 && @ac_total <= 7
    @result_id = 18

    # 堅実
  elsif @cp_total >= 16 && @np_total >= 7 && @np_total <= 14 && @a_total >= 7 && @a_total <= 14 && @fc_total >= 7 && @fc_total <= 14 && @ac_total >= 7 && @ac_total <= 14
    @result_id = 19

    # お人好し
  elsif @cp_total >= 6 && @cp_total <= 14 && @np_total >= 15 && @a_total >= 6 && @a_total <= 14 && @fc_total >= 6 && @fc_total <= 14 && @ac_total >= 6 && @ac_total <= 14
    @result_id = 20

    # 理屈
  elsif @cp_total >= 7 && @cp_total <= 14 && @np_total >= 7 && @np_total <= 14 && @a_total >= 15 && @fc_total >= 7 && @fc_total <= 14 && @ac_total >= 7 && @ac_total <= 14
    @result_id = 21

    # 自由奔放
  elsif @cp_total >= 6 && @cp_total <= 14 && @np_total >= 6 && @np_total <= 14 && @a_total >= 6 && @a_total <= 14 && @fc_total >= 15 && @ac_total >= 6 && @ac_total <= 14
    @result_id = 22

    # 繊細
  elsif @cp_total >= 4 && @cp_total <= 14 && @np_total >= 4 && @np_total <= 14 && @a_total >= 4 && @a_total <= 14 && @fc_total >= 4 && @fc_total <= 14 && @ac_total >= 15
    @result_id = 23

    # elsif @cp_total && @np_total && @a_total && @fc_total && @ac_total
    #   @result_id=

  else
    # render :test ,notice: "該当しませんでした"
    @result_id = 24

  end
end

# ストロングパラメータ(セキュリティ) https://qiita.com/morikuma709/items/2dc20d922409ae7ce216
# 書き方=>params.require(:使用するモデル名).permit(:使用するカラム名)
def ego_score_params
  params.require(:ego_score).permit(:cp_score, :np_score, :a_score, :fc_score,
                                    :ac_score).merge(user_id: current_user.id)
end

def test_result_params
  params.require(:test_result).permit(:egogram_type, :character, :stregth, :weakness, :people_around_you)
end
