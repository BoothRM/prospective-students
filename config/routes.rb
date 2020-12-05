Rails.application.routes.draw do



  # Routes for the Admit resource:

  # CREATE
  post("/insert_admit", { :controller => "admits", :action => "create" })
          
  # READ
  get("/admits", { :controller => "admits", :action => "index" })
  
  get("/admits/:path_id", { :controller => "admits", :action => "show" })
  
  # UPDATE
  
  post("/modify_admit/:path_id", { :controller => "admits", :action => "update" })
  
  # DELETE
  get("/delete_admit/:path_id", { :controller => "admits", :action => "destroy" })

  #------------------------------

  # Routes for the Prospect resource:

  # CREATE
  post("/insert_prospect", { :controller => "prospects", :action => "create" })
          
  # READ
  get("/", { :controller => "prospects", :action => "index" })

  get("/prospects", { :controller => "prospects", :action => "index" })
  
  get("/prospects/:path_id", { :controller => "prospects", :action => "show" })
  
  # UPDATE
  
  post("/modify_prospect/:path_id", { :controller => "prospects", :action => "update" })
  
  # DELETE
  get("/delete_prospect/:path_id", { :controller => "prospects", :action => "destroy" })

  #------------------------------

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })        
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create"  })
      
  # EDIT PROFILE FORM        
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })       
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })
  
  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM

  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })
  
  # SIGN OUT        
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })
             
  #------------------------------

end
