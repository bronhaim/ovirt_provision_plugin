module OvirtProvisionPlugin
  module ReportExtensions
    extend ActiveSupport::Concern

    included do
      after_commit :new_report_callback, :on => :create
    end

    def new_report_callback
      if host.reports.count == 2
        host.ovirt_host_callback
      end
    end

  end
end
