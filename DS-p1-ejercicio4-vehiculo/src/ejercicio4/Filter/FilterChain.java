/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ejercicio4.Filter;

import ejercicio4.MotorState.MotorState;
import ejercicio4.Speedometer;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author augus
 */
public class FilterChain {
    private List<Filter> filters = new ArrayList<>();
    private Speedometer target;
    
    public void addFilter( Filter filter) {
        this.filters.add(filter);
    }
    
    public void setTarget(Speedometer target) {
        this.target = target;
    }
    
    public void execute(double rpm, MotorState state) {
        
        for (Filter filter : this.filters) {
            rpm = filter.execute(rpm, state);
        }
        if (this.target != null) {
            target.execute(rpm, state);
        }
    }
}
