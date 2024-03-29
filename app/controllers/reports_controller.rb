class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.xml
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.xml
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.xml
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @study = Study.find(params[:study_id])
    @report = @study.reports.find(params[:id])
  end

  # POST /reports
  # POST /reports.xml
  def create
    @study = Study.find(params[:study_id])
    @report = @study.reports.new(params[:report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to(@study, :notice => 'Report was successfully created.') }
        format.xml  { render :xml => @report, :status => :created, :location => @report }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.xml
  def update
    @study = Study.find(params[:study_id])
    @report = @study.reports.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to(@study, :notice => 'Report was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @report.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.xml
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to(study_path(@report.study_id)) }
      format.xml  { head :ok }
    end
  end
end
