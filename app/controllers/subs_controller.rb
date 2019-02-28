class SubsController < ApplicationController
  # Views - user interaction, logic should be keep at a minimum
  # Controller /routes - is used for directing traffic, actions
  # Models - all logic on the table/ record in the database

  # Skinny Controllers / Fat Models (only thing for controllers should be to directing traffic and doing actions)

  # ACTIONS - for controller
  #   index
  #   edit
  #   show
  #   new

  # Shows all of the items in the model
    #index @model_name_plural = Model_name.all

  
  # Search record to update / render edit form
    # edit @model_name = Model.name.find(params[:id])

  # Search record / show a specific record
    # show @model_name = Model.name.find(params[:id])

  # Creates record in memory /rendering the new form
    # new @model_name = Model_name.new

  # CRUD
  #   create
  #   read
  #   update
  #   destroy

  # Create -> Post #onto the database
  # create Model_name.create(model_name_params)
    # @model_name = Model_name.new(model_name_params)

    # if @model_name.save
    #   do something
    #   else
    #     render :new
    #   end
  # Read -> Get
    #   shows all of the items in the model
    #   index @model_names = Model_name.all

    #   search record to update / render edit form
    #   edit @model_name = Model_name.find(params[:id])

    #   search record / shows a specific record
    #   show @model_name = Model_name.find(params[:id])

  #   #   creates record in memory / rendering the new form
  #   #   new @model_name = Model_name.new
  # Update -> Put/Patch
  #   update Model_name.find(params[:id]).update(model_name_parmas)
      # @model_name = Model_name.find(params[:id])
      # if @model_name.update(model_name_params)
      #   do something
      #   else
      #     render :edit
      #   end
  # Destroy -> Delete
  #   destroy Model_name.find(params[:id]).destroy

  # model_name_params # private method
  #   private
  #   def model_name_params
  #     params.require(:model_name).permit(:everything the model has,)
  #   end

  # Callbakcs
  #   before_action
  #   after_action
  #   skip_before_action
  #   skip_after_action


  before_action :find_sub, only: [:show, :update, :edit, :destroy]
  # before_action :find_sub, except: [:index, :new, :create]

  def index
    @subs = Sub.all
  end

  def show
    # @sub = Sub.find(params[:id])
  end

  def new
    @sub = Sub.new
  end

  def create
    @sub = Sub.new(sub_params)

    #@sub.save returns a boolean
    if @sub.save
      redirect_to subs_path
    else
      render :new
    end
  end

  def edit
    # @sub = Sub.find(params[:id])
  end

  def update
  #  Sub.find(params[:id].update(sub_params))
    # @sub = Sub.find(params[:id])
    if @sub.update(sub_params)
      redirect_to @sub
    else
      render :edit
    end
  end

  def destroy
    # Sub.find(params[:id]).destroy
    @sub.destroy
    redirect_to subs_path
  end

  private

    def sub_params
      params.require(:sub).permit(:name)
    end

    def find_sub
      @sub = Sub.find(params[:id])
    end

end
