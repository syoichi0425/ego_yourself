
#  @cp_total=5
#   if @cp_total===(1...10) then
#     puts "aaa"
# end

# if String === "a" then        # Module
#   puts "OK"
# end

# @cp_total=5
# @np_total=5
# @a_total=5
# @fc_total=5
# @ac_total=5

# p [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].repeated_permutation(2).to_a
result_id=0
# p [1,2,3,4,5].repeated_permutation(5).to_a
# ,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20

[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20].repeated_permutation(5) do |a, b, c,d,e|
 @cp_total=a
 @np_total=b
 @a_total=c
 @fc_total=d
 @ac_total=e

  if @cp_total>=11 && @np_total<=9 && @a_total>=11  && @fc_total<=9 && @ac_total>=11
  p result_id=1
    p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#楽天家
  elsif @cp_total<=@np_total && @np_total>=14  && @a_total<=@np_total  && @fc_total>=14 && @ac_total<=@np_total
    p result_id=2
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#献身
  elsif @cp_total<=@np_total && @np_total>=14 && @a_total<=@np_total && @fc_total<=@np_total && @ac_total>=10
    p result_id=3
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#野心家
  elsif @cp_total>=10 && @np_total<@cp_total && @a_total<=@np_total && @fc_total>=10 && @ac_total<@cp_total
    p result_id=4
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#合理的
  elsif @cp_total<=6 && @np_total>=6 && @np_total<=10 && @a_total>=11 && @fc_total>=6 && @fc_total<=10 && @ac_total<=6
    p result_id=5
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#生真面目
  elsif @cp_total>=12 && @np_total<=5 && @np_total<=11 && @a_total<=4 && @fc_total>=5 && @fc_total<=11 && @ac_total>=12
    p result_id=6
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#ネガティブ
  elsif @cp_total>=18 && @np_total<=6 && @a_total<=6 && @fc_total<=6 && @ac_total>=18
    p result_id=7
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#天真爛漫
  elsif @cp_total<=12 && @np_total>=16 && @a_total>=12 && @a_total<=16 && @fc_total>=16 && @ac_total<=12
    p result_id=8
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#パーフェクト
  elsif @cp_total>=14 && @np_total>=14 && @a_total>=14 && @fc_total>=14 && @ac_total>=14
    p result_id=11
    p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#頑固
  elsif @cp_total>=16 && @np_total<=@cp_total && @a_total<=@np_total  &&  @fc_total<=@a_total && @ac_total<=@fc_total
    p result_id=9
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#駄々っ子
  elsif @cp_total<=@fc_total && @np_total<=@fc_total && @a_total<=@fc_total && @fc_total>=14 && @ac_total>=@fc_total
    p result_id=10

p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"

#平凡
  elsif @cp_total>=8 && @cp_total<=13 && @np_total>=8 && @np_total<=13 && @a_total>=8 && @a_total<=13 && @fc_total>=8 && @fc_total<=13 && @ac_total>=8 && @ac_total<=13
    p result_id=12
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#無欲
  elsif @cp_total<=8 && @np_total<=8 && @a_total<=8 && @fc_total<=8 && @ac_total<=8
    p result_id=13
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#お気楽ルーズ
  elsif @cp_total<=7 && @np_total>=14 && @a_total>=14 && @fc_total>=14 && @ac_total>=14
    p result_id=14
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#クール
  elsif @cp_total>=14 && @np_total<=7 && @a_total>=14 && @fc_total>=14 && @ac_total>=14
    p result_id=15
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#直感行動
  elsif @cp_total>=14 && @np_total>=14 && @a_total<=7 && @fc_total>=14 && @ac_total>=14
    p result_id=16
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#心を閉じる
  elsif @cp_total>=14 && @np_total>=14 && @a_total>=14 && @fc_total<=7 && @ac_total>=14
    p result_id=17
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#熱血
  elsif @cp_total>=14 && @np_total>=14 && @a_total>=14 && @fc_total>=14 && @ac_total<=7
    p result_id=18
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#堅実
  elsif @cp_total>=16 && @np_total>=7 && @np_total<=14 && @a_total>=7 && @a_total<=14 && @fc_total>=7 && @fc_total<=14 && @ac_total>=7 && @ac_total<=14
    p result_id=19
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#お人好し
  elsif @cp_total>=6 && @cp_total<=14 && @np_total>=15 && @a_total>=6 && @a_total<=14 && @fc_total>=6 && @fc_total<=14 && @ac_total>=6 && @ac_total<=14
    p result_id=20
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#理屈
  elsif @cp_total>=7 && @cp_total<=14 && @np_total>=7 && @np_total<=14 && @a_total>=15 && @fc_total>=7 && @fc_total<=14 && @ac_total>=7 && @ac_total<=14
    p result_id=21
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#自由奔放
  elsif @cp_total>=6 && @cp_total<=14 && @np_total>=6 && @np_total<=14 && @a_total>=6 && @a_total<=14 && @fc_total>=15 && @ac_total>=6 && @ac_total<=14
    p result_id=22
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
#ナイーブ
  elsif @cp_total>=4 && @cp_total<=14 && @np_total>=4 && @np_total<=14 && @a_total>=4 && @a_total<=14 && @fc_total>=4 && @fc_total<=14 && @ac_total>=15
    p result_id=24
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"

  # elsif @cp_total && @np_total && @a_total && @fc_total && @ac_total
  #   p result_id=


  else
    p result_id="該当しませんでした"
p "■#{@cp_total}-#{@np_total}-#{@a_total}-#{@fc_total}-#{@ac_total}"
 end
 end


