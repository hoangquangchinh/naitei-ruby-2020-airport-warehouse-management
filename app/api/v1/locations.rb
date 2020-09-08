class Locations < BaseV1
  resource :locations do
    desc "Return all location"
    get "/" do
      Location.all
    end

    desc "Return all empty locations in ready warehouse"
    get "/slots" do
      Location.select(:id, :filled).location_false.ready_false
    end

    desc "Return one empty location in ready warehouse"
    get "/slot" do
      Location.select(:id, :filled).location_false.ready_false.first
    end
  end
end
