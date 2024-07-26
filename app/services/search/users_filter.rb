class Search::UsersFilter < Search::BaseFilterService
  def call
    @users = User.all.includes(@includes)

    @users = filter_by_query
  end

  private

  def filter_by_query
    return @users unless @params[:query].present?

    query = @params[:query].strip.downcase
    @users.where(firstname: query).or(@users.where(lastname: query)).or(@users.where(email: query))
  end
end
