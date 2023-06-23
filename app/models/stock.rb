class Stock < ApplicationRecord
    has_many :user_stocks
    has_many :users, through: :user_stocks
    validates :name, :ticker, presence: true
    def self.new_lookup(ticker_symbol)
        client = IEX::Api::Client.new(
        publishable_token: 'pk_1b34e680d72f4d3ba9dcd5787b4e494b',
        secret_token: 'sk_87e726b9887d4062b959ad2469063fc1',
        endpoint: 'https://cloud.iexapis.com/v1'
    )
begin

    new(ticker:ticker_symbol,name:client.company(ticker_symbol).company_name,last_price:client.price(ticker_symbol))
rescue => exception
    return nil 
end
end
def self.check_db(ticker_symbol)
    where(ticker:ticker_symbol).first
end
end
