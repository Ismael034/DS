/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;

/**
 *
 * @author augus
 */
public class FilterCalculateVelocity implements Filter {
    int INCREASEVELOCITY = 100;
    int MAXVELOCITY = 5000;
    @Override
    public double execute(double rpm, MotorState state) {
        switch(state) {
            case MotorState.ACELERANDO -> {
                rpm += INCREASEVELOCITY;
                if (rpm > MAXVELOCITY) {
                    rpm = MAXVELOCITY;
                }
                System.out.println("FILTER CALCULATE_VELOCITY");
                 System.out.println(rpm);
            }
            case MotorState.FRENANDO -> {
                rpm -= INCREASEVELOCITY;
                if (rpm < 0) {
                    rpm = 0;
                }
            }

        }
        
        return rpm;
    }
}
