class MasterId < ApplicationRecord
  before_create :generate_snowflake_id

  def self.count_datacenter_and_worker_ids
    datacenter_counts = MasterId.group("snowflake_data->>'datacenter_id'").count
    worker_counts = MasterId.group("snowflake_data->>'worker_id'").count

    { datacenter_counts: datacenter_counts, worker_counts: worker_counts }
  end

  private
  def generate_snowflake_id
    datacenter_id = ENV['DATACENTER_ID'].to_i
    worker_id = ENV['WORKER_ID'].to_i
    self.snowflake_id = Snowflake::IdGenerator.new(datacenter_id, worker_id).next_id
    self.snowflake_data = Snowflake::IdAnalyzer.new(self.snowflake_id).analyze
  end
end
