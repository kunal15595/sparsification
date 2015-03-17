function [ x ] = GD( y, D, s )

    gamma = 0.1;
    num_steps = 500;
    steps_left = num_steps;
    x = zeros(size(D,2),size(y,2));
    threshold = norm(y)/100;

    disp('threshold: ')
    disp(threshold);

    while steps_left > 0,
        

        past_norm = norm(y - D*x);

        if norm(y - D*x) < threshold,
            disp('final norm: ');
            disp(past_norm); 
            
            disp('steps required: ');
            disp(num_steps - steps_left);
            
            break;
        end
        
        x = x + (D.')*(y - D*x)/(1 + gamma);
        x = truncate(x, s);

        if abs(norm(y - D*x) - past_norm) < threshold/10,
           disp('local minima');
           disp('steps taken: ');
           disp(num_steps - steps_left);
           
           break;
           disp('final norm: ');
           disp(past_norm);
        end
        steps_left = steps_left - 1;
    end
    disp('norm: ')
    disp(norm(y - D*x)) 
end
