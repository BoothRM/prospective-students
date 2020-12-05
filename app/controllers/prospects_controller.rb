class ProspectsController < ApplicationController
  def index
    matching_prospects = Prospect.all

    @list_of_prospects = matching_prospects.order({ :created_at => :desc })

    render({ :template => "prospects/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_prospects = Prospect.where({ :id => the_id })

    @the_prospect = matching_prospects.at(0)

    render({ :template => "prospects/show.html.erb" })
  end

  def create
    the_prospect = Prospect.new
    the_prospect.user_id = @current_user.id
    the_prospect.name = params.fetch("query_name")
    the_prospect.country = params.fetch("query_country")
    the_prospect.round = params.fetch("query_round")
    the_prospect.details = params.fetch("query_details")
    the_prospect.contact = params.fetch("query_contact")
    the_prospect.status = params.fetch("query_status")

    if the_prospect.valid?
      the_prospect.save
      redirect_to("/prospects", { :notice => "Prospect created successfully." })
    else
      redirect_to("/prospects", { :alert => "Prospect failed to create successfully." })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_prospect = Prospect.where({ :id => the_id }).at(0)

    the_prospect.user_id = @current_user.id
    the_prospect.country = params.fetch("query_country")
    the_prospect.round = params.fetch("query_round")
    the_prospect.details = params.fetch("query_details")
    the_prospect.contact = params.fetch("query_contact")
    the_prospect.status = params.fetch("query_status")

    if the_prospect.valid?
      the_prospect.save
      redirect_to("/prospects/#{the_prospect.id}", { :notice => "Prospect updated successfully."} )
    else
      redirect_to("/prospects/#{the_prospect.id}", { :alert => "Prospect failed to update successfully." })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_prospect = Prospect.where({ :id => the_id }).at(0)

    the_prospect.destroy

    redirect_to("/prospects", { :notice => "Prospect deleted successfully."} )
  end
end
