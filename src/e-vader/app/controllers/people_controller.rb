class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit, :update, :destroy]

  # GET /people
  def index
    @people = Person.all
  end

  # GET /people/1
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  def create
    @person = Person.new(person_params)
    if @person.save
      flash[:success] = 'La persona ha sido creada exitosamente.'
      redirect_to @person
    else
      render :new
    end
  end

  # PATCH/PUT /people/1
  def update
    if @person.update(person_params)
      flash[:success] = 'La persona ha sido actualizada exitosamente.'
      redirect_to @person
    else
      render :edit
    end
  end

  # DELETE /people/1
  def destroy
    @person.destroy
    flash[:success] = 'La persona ha sido borrada exitosamente.'
    redirect_to people_url
  end

  private
    def set_person
      @person = Person.find(params[:id])
    end

    def person_params
      params.require(:person).permit(:name, :identification_code_type, :identification_code_number)
    end
end
