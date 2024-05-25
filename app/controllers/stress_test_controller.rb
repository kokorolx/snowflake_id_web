class StressTestController < ApplicationController
  def cpu
    duration = params[:duration].to_i || 10
    stress_cpu_service = StressCpuService.new(duration: duration)
    stress_cpu_service.stress_test

    render json: { message: "#{ENV['DATACENTER_NAME']} - Stress test completed after #{duration} seconds." }
  end

  def ram
  end
end
