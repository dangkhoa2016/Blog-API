# frozen_string_literal: true

class Api::V1::Android::PostsController < ApplicationController
  respond_to :json

  include Pundit::Authorization
  include Pagy::Backend

  before_action :authenticate_user!
  before_action :set_post, only: %i[show update destroy]

  # GET /api/v1/android/posts
  def index
    posts = Post.includes(:user)
    @pagy, @posts = pagy(posts)
  end

  # GET /api/v1/android/posts/:id
  def show
    render json: @post
  end

  # POST /api/v1/android/posts
  def create
    @post = current_user.posts.new(post_params)

    if @post.save
      render :create, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT api/v1/android/posts/:id
  def update
    authorize @post

    if @post.update(post_params)
      render_success(I18n.t('updated', res: 'Post'), :ok)
    else
      render json: { errors: @post.errors }, status: :unprocessable_entity
    end
  end

  # DELETE api/v1/android/posts/:id
  def destroy
    authorize @post

    @post.destroy
  end

  private

  def set_post
    @post = Post.find_by(id: params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
