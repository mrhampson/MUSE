function nnupdatefigures(nn,fhandle,L,opts,i, hiddenWeights, outputWeights, hiddenActivations, outputActivations)
%NNUPDATEFIGURES updates figures during training
if i > 1 %dont plot first point, its only a point   
    x_ax = 1:i;
    % create legend
    if opts.validation == 1
        M            = {'Training','Validation'};
    else
        M            = {'Training'};
    end
    
    %create data for plots
    if strcmp(nn.output,'softmax')
        plot_x       = x_ax';
        plot_ye      = L.train.e';
        plot_yfrac   = L.train.e_frac';
        
    else
        plot_x       = x_ax';
        plot_ye      = L.train.e';
    end
    
    %add error on validation data if present
    if opts.validation == 1
        plot_x       = [plot_x, x_ax'];
        plot_ye      = [plot_ye,L.val.e'];
    end
    
    
    %add classification error on validation data if present
    if opts.validation == 1 && strcmp(nn.output,'softmax')
        plot_yfrac   = [plot_yfrac, L.val.e_frac'];        
    end
    
%    plotting
    figure(fhandle);   
    if strcmp(nn.output,'softmax')  %also plot classification error
                
        plotRows = 3;
        plotCols = 2;
        
        p1 = subplot(plotRows,plotCols,1);
        plot(plot_x,plot_ye);
        xlabel('Number of epochs'); ylabel('Error');title('Error');
        title('Error')
        legend(p1, M,'Location','NorthEast');
        set(p1, 'Xlim',[0,opts.numepochs + 1])
        
        p2 = subplot(plotRows,plotCols,2);
        plot(plot_x,plot_yfrac);
        xlabel('Number of epochs'); ylabel('Misclassification rate');
        title('Misclassification rate')
        legend(p2, M,'Location','NorthEast');
        set(p2, 'Xlim',[0,opts.numepochs + 1])
        
        % hidden layer weight updates at node 1
        p3 = subplot(plotRows,plotCols,3);
        [rows, columns] = size(hiddenWeights);
        xPlotHidden = ones(rows, columns);
        if rows > 1,
            for index = 2:rows,
                xPlotHidden(index,:) = xPlotHidden(index,:) * index;
            end
        end
        plot(xPlotHidden,hiddenWeights)
        xlabel('Number of epochs'); ylabel('Weights');
        title('Hidden Layer Weight Updates (Node 1)')
        M2 = {'w0', 'w1', 'w2', 'w3', 'w4', 'w5', 'w6', 'w7', 'w8'};
        legend(p3, M2,'Location','eastoutside');
        set(p3, 'Xlim',[0,opts.numepochs + 1])
        
        % output layer weight updates at node 1
        p4 = subplot(plotRows,plotCols,4);
        [rows2, columns2] = size(outputWeights);
        xPlotOutput = ones(rows2, columns2);
        if rows2 > 1,
            for index2 = 2:rows2,
                xPlotOutput(index2,:) = xPlotOutput(index2,:) * index2;
            end
        end
        plot(xPlotOutput,outputWeights)
        xlabel('Number of epochs'); ylabel('Weights');
        title('Output Layer Weight Updates (Node 1)')
        M3 = {'w0', 'w1', 'w2', 'w3'};
        legend(p4, M3,'Location','eastoutside');
        set(p4, 'Xlim',[0,opts.numepochs + 1])
        
        % acivation outputs at hidden layer
%         p5 = subplot(plotRows,plotCols,5);
%         [rows3, columns3] = size(hiddenActivations);
%         hiddenActivationX = ones(rows3, columns3);
%         if rows3 > 1,
%             for index3 = 2:rows3,
%                 hiddenActivationX(index3,:) = hiddenActivationX(index3,:) * index3;
%             end
%         end
%         plot(hiddenActivationX,hiddenActivations)
%         xlabel('Number of epochs'); ylabel('Activations');
%         title('Hidden Layer Activations (Node 1)')
%         legend(p5, M(1),'Location','NorthEast');
%         set(p5, 'Xlim',[0,opts.numepochs + 1])
        
        % activation outputs at output layer
%         p6 = subplot(plotRows,plotCols,6);
%         [rows4, columns4] = size(outputActivations);
%         outputActivationX = ones(rows4, columns4);
%         if rows4 > 1,
%             for index4 = 2:rows4,
%                 outputActivationX(index4,:) = outputActivationX(index4,:) * index4;
%             end
%         end
%         plot(outputActivationX,outputActivations)
%         xlabel('Number of epochs'); ylabel('Activations');
%         title('Output Layer Activations (Node 1)')
%         legend(p6, M(1),'Location','NorthEast');
%         set(p6, 'Xlim',[0,opts.numepochs + 1])
    else
        
        p = plot(plot_x,plot_ye);
        xlabel('Number of epochs'); ylabel('Error');title('Error');
        legend(p, M,'Location','NorthEast');
        set(gca, 'Xlim',[0,opts.numepochs + 1])
                
    end
    drawnow;
end
end
