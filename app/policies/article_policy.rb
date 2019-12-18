class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    @record.author == @user
  end

  def edit?
    new?
  end
end