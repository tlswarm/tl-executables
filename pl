#!/bin/bash

source ~/swarmbot4/swarmbot_ws/devel/setup.bash;

rqt_plot

case "$1" in

         head)
/SwarmbotLocalisation/gps/fix/heading_track_over_ground /SwarmbotLocalisation/gps/fix/dual_antenna_heading /SwarmbotLocalisation/gps/fix/heading/data             
;;
        spray)
/SwarmbotAttachments/sprayer_v1/spray_pressure /SwarmbotAttachments/sprayer_v1/spray_pressure_reference             
;;
         speed)
/SwarmbotPlcController/hardware_responses/wheel_linear_vel_front_left /SwarmbotPlcController/hardware_responses/wheel_linear_vel_front_right /SwarmbotPlcController/hardware_responses/wheel_linear_vel_rear_left /SwarmbotPlcController/hardware_responses/wheel_linear_vel_rear_right
;;
         press)
/SwarmbotPlcController/hardware_responses/front_mobility_pump_pressure /SwarmbotPlcController/hardware_responses/rear_mobility_pump_pressure             
;;
         steer)
/SwarmbotPlcController/hardware_responses/articulation_angle /SwarmbotPlcController/steering_command /SwarmbotPlatformController/distance_to_path/current             
;;
     	 drive)
 /SwarmbotPlcController/drive_velocity_command /SwarmbotPlcController/hardware_responses/wheel_linear_vel_average /SwarmbotLocalisation/gps/fix/velocities/ground	
;;
	attvel)
		/SwarmbotAttachments/sprayer_v1/spray_pressure /SwarmbotPlcController/hardware_responses/encoder_rear_left /SwarmbotPlcController/hardware_responses/encoder_rear_right
             ;;
   esac
