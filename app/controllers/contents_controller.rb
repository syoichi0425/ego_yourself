class ContentsController < ApplicationController
  before_action :ego_result_params, only: [:user_page]

  def guest_sign_in
    #find_or_create_by=>設定しているEメールが見つからない場合、設定したメールを作成する
    user = User.find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      # user.confirmed_at = Time.now  <= Confirmable を使用している場合は必要
      # 例えば name を入力必須の場合、user.name = "ゲスト" なども必要
    end
    sign_in user
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end


  def home
    @test_result = TestResult.all
  end


  def new
    @raise_type_id = User.new
  end

  def index
    #自身のカレンダーの情報
    @diaries = Diary.where(user_id: current_user.id)

    goal=Goal.where(user_id: current_user.id)
    if goal.present?
      @goal=goal.order(created_at: :desc).first.goal_content_4
    else
      @goal="記載がありません"
    end

    week=Week.where(user_id: current_user.id)
    # .first.week_4
    if week.present?
      @week=week.order(created_at: :desc).first.week_4
    else
      @week="記載がありません"
    end

    diary=Diary.where(user_id: current_user.id)
    if diary.present?
      # @diary=diary.order(created_at: :desc).limit(1)
      # diary.order(created_at: :desc).diary_content_2だとnomethoderrerとなる
      @diary_content_0=diary.last.diary_content_0
      @diary_content_1=diary.last.diary_content_1
      @diary_content_2=diary.last.diary_content_2
    else
      @diary_content_0="記載がありません"
    end




    @assess=Diary.where(user_id: current_user.id)



# マイページ：エゴグラムの最新結果表示
  if EgoScore.where(user_id: current_user.id).present?
    ego_score=EgoScore.where(user_id: current_user.id).last.test_result_id
    @result = "現在のタイプは「#{TestResult.find(ego_score).egogram_type}」タイプです"
  else
    @result ="診断していません"
  end


    @raise_type_id = User.new

    # egoscoreは最新のエゴグラム結果の表示に使用
    egoscore = EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score, :np_score,
                                                                                                :a_score, :fc_score, :ac_score).flatten
    # モデル名.pluck(:カラム名)  全てのデータではなく特定のカラムの値だけ取得

    @cp = egoscore[0]
    @np = egoscore[1]
    @a = egoscore[2]
    @fc = egoscore[3]
    @ac = egoscore[4]
  end

  def user_page
    @diaries = Diary.where(user_id: current_user.id)
    @index = EgoScore.where(user_id: current_user.id).last.test_result_id
    @result = EgoScore.where(user_id: current_user.id).last.test_result_id

    @raise_type_id = User.new
  end

  def create
    raise_type = User.find(current_user.id)
    user = params[:raise_type_id]
    raise_type.update(raise_type_id: user)
    render 'index'
  end


  private

  def raise_type_id_params
    params.require(:user).permit(:raise_type_id)
  end

  def ego_quetions_toatl_params # ラジオボタンで取得した各paramsの合計値を出すアクション(testアクションとcreateアクションで主に使用予定)
    # params[:オブジェクト名(テーブルのカラム名など)]
    @cp_total = params[:q_cp1].to_i + params[:q_cp2].to_i
    @np_total = params[:q_np1].to_i + params[:q_np2].to_i
    @a_total  = params[:q_a1].to_i  + params[:q_a2].to_i
    @fc_total = params[:q_fc1].to_i + params[:q_fc2].to_i
    @ac_total = params[:q_ac1].to_i + params[:q_ac2].to_i
    # test.html.erbにあるsubmitを押したらcreateアクションが発動
  end

  def ego_result_params # 診断結果の各合計値のカラム値最新を取得=>EgoScoreから最新の各カラムの値を取得するアクション
    # 未実装:ログインユーザーid(user_id)とegoscoreのuser_idが同じかどうかで本人か識別
    # unless EgoScore(params[user_session])==current_user
    #   redirecto_to root_path
    # end

    egoscore = EgoScore.where(user_id: current_user.id).order(updated_at: :desc).limit(1).pluck(:cp_score, :np_score,                                                              :a_score, :fc_score, :ac_score).flatten
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
    # if cp<4 && np<4 && a<4 && fc<4 && ac<4
    @result = if @cp >= 0 && @np >= 0 && @a >= 0 && @fc >= 0 && @ac >= 0
                TestResult.where(id: 1)
              # elsif cp<10 && np>10
              #  elsif cp<3 && np>3
              #   @result=TestResult.where(id: 2)
              #    #&& np<10 && a<10 && fc<10 && ac<10
              # # #ifで決定したidをResultのidに代入し、result.htmlに値を渡す
              else
                TestResult.where(id: 2)

              end
  end

  # ストロングパラメータ(セキュリティ) https://qiita.com/morikuma709/items/2dc20d922409ae7ce216
  # 書き方=>params.require(:使用するモデル名).permit(:使用するカラム名)
  def ego_score_params
    params.require(:ego_score).permit(:cp_score, :np_score, :a_score, :fc_score,
                                      :ac_score).merge(user_id: current_user.id)
  end
end
