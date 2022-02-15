class EgogramsController < ApplicationController
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
