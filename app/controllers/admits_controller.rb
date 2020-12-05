class AdmitsController < ApplicationController
  def index
    matching_admits = Admit.all

    @list_of_admits = matching_admits.order({ :created_at => :desc })

    render({ :template => "admits/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_admits = Admit.where({ :id => the_id })

    @the_admit = matching_admits.at(0)

    render({ :template => "admits/show.html.erb" })
  end

  def create
    the_admit = Admit.new
    the_admit.prospect_id = params.fetch("query_prospect_id")

    if the_admit.valid?
      the_admit.save
      redirect_to("/admits", { :notice => "Admit created successfully." })
    else
      redirect_to("/admits", { :notice => "Admit failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_admit = Admit.where({ :id => the_id }).at(0)

    the_admit.prospect_id = params.fetch("query_prospect_id")

    if the_admit.valid?
      the_admit.save
      redirect_to("/admits/#{the_admit.id}", { :notice => "Admit updated successfully."} )
    else
      redirect_to("/admits/#{the_admit.id}", { :alert => "Admit failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_admit = Admit.where({ :id => the_id }).at(0)

    the_admit.destroy

    redirect_to("/admits", { :notice => "Admit deleted successfully."} )
  end
end
