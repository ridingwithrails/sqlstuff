let(:account_params) do
    {
      brand_id: org_id,
      from_date: '1/1/2017',
      to_date: '1/10/2017',
      duration: '0',
      aggregate: 'true',
      notifiable_params: 'key',
      action_name: 'action',
      property_type: 'TwAds::Account',
      property_id: account.id,
      segmentation_type: nil,
      children_ids: [campaign.service_id],
      filters: nil,
      labels: nil,
      level: nil,
      metric_keys: nil
    }
  end


      property_type: 'TwAds::Account',
     property_id: account.id.to_s,
     segmentation_type: nil,
     children_ids: [campaign.service_id.to_s],
     filters: nil,
     labels: nil,
     level: nil,
     metric_keys: nil,
     notifiable_params: 'key',
     start_time: Time.use_zone(account.timezone) { Chronic.parse('1/1/2017').beginning_of_day },
     end_time: Time.use_zone(account.timezone) { Chronic.parse('1/10/2017').end_of_day },
     auth_data: auth_data,
     brand_id: account.brand_id,
     uid: 1,
     path_name: 'delivery_metrics'
