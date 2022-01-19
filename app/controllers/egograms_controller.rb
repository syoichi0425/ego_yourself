class EgogramsController < ApplicationController
  def test
#    @test=EgogramCpQuetion.new
    @test=EgogramCpQuetion.select("title")

  end

  def result
  end

  def confirmation
  end
end
