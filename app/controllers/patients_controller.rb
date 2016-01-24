class PatientsController < ApplicationController

	def index

     @doctor=Doctor.find_by_id(params[:doctor_id])
     @patients=@doctor.patients
		
	end

	def new
		@doctor=Doctor.find_by_id(params[:doctor_id])
		@patient=@doctor.patients.new
	end

	def create
		@doctor=Doctor.find_by_id(params[:doctor_id])
		patient=@doctor.patients.new(patient_params)
		if patient.save
			redirect_to doctor_patients_path(@doctor)
		else
			render new
		end

			


	end

	def edit
		@doctor=Doctor.find_by_id(params[:doctor_id])
		@patient=@doctor.patients.find(params[:id])
	end


	def update
		@doctor=Doctor.find_by_id(params[:doctor_id])
		@patient=@doctor.patients.find(params[:id])
		if @patient.update(patient_params)
			redirect_to doctor_patients_path(@doctor)
		else
			render edit
		end
	end

	

	private 
	def patient_params
		params.require(:patient).permit(:name,:diseas,:doctor_id)
	end

end