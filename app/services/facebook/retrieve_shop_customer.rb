module Facebook
  class RetrieveShopCustomer < BaseService
    def initialize shop, psid
      @shop = shop
      @psid = psid
    end

    def call
      create_or_update_customer if facebook_user_profile.present?
    end

    private
    attr_reader :shop, :psid

    def fetch_facebook_user_info
      conn = Faraday.new url: File.join(Settings.facebook.host, psid.to_s)
      response = conn.get do |req|
        req.params["fields"] = "first_name,last_name,profile_pic,gender"
        req.params["access_token"] = shop.facebook_page_access_token
      end
    end

    def facebook_user_profile
      response = fetch_facebook_user_info
      JSON.parse(response.body) if response.success?
    end

    def create_or_update_customer
      customer = Customer.find_or_initialize_by facebook_id: psid, shop_id: shop.id
      customer.tap {|c| c.update_attributes customer_hash(c)}
    end

    def customer_hash customer
      {
        facebook_id: customer.facebook_id.try(:presence) ||facebook_user_profile["id"],
        name: customer.name.try(:presence) || fullname,
        email: customer.email.try(:presence) || "#{facebook_user_profile['id']}@facebook.com",
        profile_picture_url: facebook_user_profile["profile_pic"]
      }
    end

    def fullname
      "#{facebook_user_profile['last_name']} #{facebook_user_profile['first_name']}"
    end

  end
end
