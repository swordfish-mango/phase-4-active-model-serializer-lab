class AuthorSerializer < ActiveModel::Serializer
  attributes :name
  belongs_to :profile
  has_many :posts, serializer: AuthorPostsSerializer

  def index
    authors = Author.all
    render json: authors, include: ['posts','posts.tags']
  end

  def show
    author = Author.find(params[:id])
    render json: author, include: ['post','posts.tags']
  end
end
