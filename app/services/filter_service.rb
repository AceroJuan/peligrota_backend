class FilterService
  def initialize(filter_params = {})
    @danger_levels = filter_params[:danger_levels] ||= [1,2,3,4,5]
    @datestart = filter_params[:datestart] ||= '01/01/2018'
    @dateend = filter_params[:dateend] ||= DateTime.now
    @timestart = filter_params[:timestart] ||= '00:00'
    @timeend = filter_params[:timeend] ||= '24:00'
  end

  def filter
    danger_level_records = Incident.all.where("danger_level in (#{@danger_levels.join(',')})")
    date_range_records = danger_level_records.where(datetime: @datestart..@dateend)
    filter_result = date_range_records.select{ |i| i.datetime.strftime('%R').between?(@timestart,@timeend)}
  end

end
