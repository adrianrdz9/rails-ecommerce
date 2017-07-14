class ChancePricingPrecisionFromProducts < ActiveRecord::Migration[5.0]
  def change
    change_column :products, :pricing, :integer, precision: 2

  end
end
