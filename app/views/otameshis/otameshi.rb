  def index
    @current_user = Diary.where(user_id: current_user.id).all


    #日記一覧のページネーション:投稿リンク
    @posts = @current_user.paginate(page: params[:page])

    #日記一覧のページネーション:日記一覧
    diary_page = Diary.where(user_id: current_user.id)
    @diary_page = Kaminari.paginate_array(diary_page).page(params[:page]).per(10)

    #@current_day:現在の日の年月を表示
    @current_day = Date.today

    #日記の一覧表示
    from_date = Date.new(@current_day.year, @current_day.month, @current_day.beginning_of_month.day).beginning_of_week(:sunday)
    day_of_week_date = Date.new(@current_day.year, @current_day.month, @current_day.end_of_month.day).end_of_week(:sunday)
    calendar_data = from_date.upto(day_of_week_date)
    weeks = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']



    calendar_data.each do |date|
      user_diary_day = @current_user.where(created_at: date).pluck(:created_at)
      day_rename = user_diary_day.map{ |i| i.strftime("%Y-%m-%d")}
      created_day = @current_user.where(created_at: date).pluck(:id)
        if date.to_s == day_rename[0].to_s
          <h3>
            @edit_link = link_to date,edit_diary_path(created_day,diary_day: date)
            @day_of_week= weeks[date.wday]
          </h3>

          @diary_content_0 = Diary.find_by(created_at: date).diary_content_0
            <hr class="hr1">
          @diary_content_1 = Diary.find_by(created_at: date).diary_content_1
            <hr class="hr1">
          @diary_content_2 = Diary.find_by(created_at: date).diary_content_2
          <hr class="hr2">
        else
          "日記がありません"
        end
      end
    end



    def index
      @current_user = Diary.where(user_id: current_user.id).all


      #日記一覧のページネーション:投稿リンク
      @posts = @current_user.paginate(page: params[:page])

      #日記一覧のページネーション:日記一覧
      diary_page = Diary.where(user_id: current_user.id)
      @diary_page = Kaminari.paginate_array(diary_page).page(params[:page]).per(10)

      #@current_day:現在の日の年月を表示
      @current_day = Date.today

      #日記の一覧表示
      from_date = Date.new(@current_day.year, @current_day.month, @current_day.beginning_of_month.day).beginning_of_week(:sunday)
      day_of_week_date = Date.new(@current_day.year, @current_day.month, @current_day.end_of_month.day).end_of_week(:sunday)
      @calendar_data = from_date.upto(day_of_week_date)
      @weeks = ['(日)', '(月)', '(火)', '(水)', '(木)', '(金)', '(土)']
      @calendar_data1 = from_date.upto(day_of_week_date)

view
      @calendar_data.each do |date|

        user_diary_day = @current_user.where(created_at: date).pluck(:created_at)
        day_rename = user_diary_day.map{ |i| i.strftime("%Y-%m-%d")}
        created_day = @current_user.where(created_at: date).pluck(:id)
          if date.to_s == day_rename[0].to_s

              @edit_link = link_to date,edit_diary_path(created_day,diary_day: date)
              @day_of_week= weeks[date.wday]


            @diary_content_0 = Diary.find_by(created_at: date).diary_content_0

            @diary_content_1 = Diary.find_by(created_at: date).diary_content_1

            @diary_content_2 = Diary.find_by(created_at: date).diary_content_2
          else
            "日記がありません"
          end
        end
      end