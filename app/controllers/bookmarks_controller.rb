class BookmarksController < ApplicationController
  before_filter :find_by_name, :only => %w{show edit update destroy}

  def index
    @bookmarks = Bookmark.all.paginate(:page => params[:page])

    respond_to do |format|
      format.html
    end
  end

  def new
    @bookmark = Bookmark.new

    respond_to do |format|
      format.html
    end
  end

  def edit
  end

  def create
    @bookmark = Bookmark.new(params[:bookmark])

    respond_to do |format|
      if @bookmark.save
        format.html { redirect_to(eval(@bookmark.controller+"_path"), :notice => 'Bookmark was successfully created.') }
      else
        format.html { render :action => "new" }
      end
    end
  end

  def update
    respond_to do |format|
      if @bookmark.update_attributes(params[:bookmark])
        format.html { redirect_to(bookmarks_path, :notice => 'Bookmark was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  def destroy
    @bookmark.destroy

    respond_to do |format|
      format.html { redirect_to(bookmarks_url) }
    end
  end
end
