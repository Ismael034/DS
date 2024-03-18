/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;
import ejercicio4.Speedometer;
import ejercicio4.Target;

/**
 *
 * @author augus
 */
public class FilterManager {
    private FilterChain filterChain;
    
    public FilterManager(Speedometer target) {
        this.filterChain = new FilterChain();
        this.filterChain.setTarget(target);
    }
    
    public void addFilter(Filter filter) {
        this.filterChain.addFilter(filter);
    }
    
    public void execute(double rpm, MotorState state) {
        System.out.println("FILTER_MANAGER");
        System.out.println(rpm);
        filterChain.execute(rpm, state);
    }
}
