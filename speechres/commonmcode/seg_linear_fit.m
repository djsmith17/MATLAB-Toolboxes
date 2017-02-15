% fitRLF_EF: fit a piecewise linear function to a 1-D curve.
%
% Reference: Ertel JE, Fowlkes EB (1976) "Some algorithms for linear spline and piecewise multiple linear regression" J. Am. Stat. Assoc., 71:640-648.
% Written initially to fit rate-level functions from ventral cochlear nucleus (VCN) neurons as a part of the authors Master's thesis
%
% Author: Shanqing Cai (shanqing.cai@gmail.com)
% Date: April 2007

function [knots_o, y_o, sse_o] = seg_linear_fit(sl, fr, varargin)
    toVisualize = 0;
    if (~isempty(findStringInCell(varargin, 'visualize')))
        toVisualize = 1;
    end

    numTruncLevels = 0;
    if (~isempty(findStringInCell(varargin, 'numTruncLevels')))
        numTruncLevels = varargin{findStringInCell(varargin, 'numTruncLevels') + 1};
    end
    
    toPlot = 1;
    if (~isempty(findStringInCell(varargin, 'noPlot')))
        toPlot = 0;
    end

    forcedSeg = [];
    if (~isempty(findStringInCell(varargin, 'forcedSeg')))
        forcedSeg = varargin{findStringInCell(varargin, 'forcedSeg') + 1};
    end
    
    maxSeg = [];
    if (~isempty(findStringInCell(varargin, 'maxSeg')))
        maxSeg = varargin{findStringInCell(varargin, 'maxSeg') + 1};
    end
    
%     tic;
%     d = dir;
%     fn = d(findStringInDir(d, makePicNameInit(picNum))).name;
%     eval(['a = ', strrep(fn, '.m', ''), ';']);
%     picType = strrep(a.Stimuli.short_description, ' ', ''); 
%     if (strcmp(picType, 'EH'))
%         drvWin = getDrivenWins('EH', unitPTC);
%         sptWin = getSpontWins('EH');
%     elseif (strcmp(picType, 'Wav'))
%         if (~isempty(findStringInCell(varargin, 'beshFricative')) | ~isempty(findStringInCell(varargin, 'BeshFricative')))
%             drvWin = getDrivenWins('WAV_Fricative', unitPTC);
%             sptWin = getSpontWins('Wav');
%         else
%             drvWin = getDrivenWins('WAV_Vowel', unitPTC);
%             sptWin = getSpontWins('Wav');
%         end
%     else    % Presumably tone or BBN
%         drvWin = getDrivenWins('RLV', unitPTC);
%         sptWin = getSpontWins('RLV');
%     end
%     numLevelSpont = 20;
%     useSPL = 1;
%     c = getC;
%     nmin = 5;
    
%     if (~isempty(findStringInCell(varargin, 'beshFricative')) | ~isempty(findStringInCell(varargin, 'BeshFricative')))
%         [sl, fr] = getRLF(a, c, drvWin, sptWin, numLevelSpont, useSPL, 'beshFricative');
%     else
%         [sl, fr] = getRLF(a, c, drvWin, sptWin, numLevelSpont, useSPL);
%     end
    fr = mva(fr, 3);
    
    % Truncate contaminated high levels, according to the input
    sl = sl(1 : end - numTruncLevels);
    fr = fr(1 : end - numTruncLevels);
    disp(['RLF truncated levels: ', num2str(numTruncLevels)]);

    % sl and fr are assumed to be row vectors
    sl0 = sl;
    fr0 = fr;
    sl = sl';
    fr = fr';
    
% sl1 = 1 : 1 : 30;
% fr1 = zeros(size(sl1));
% sl2 = 31 : 1 : 60;
% fr2 = 5 * (sl2 - 31);
% sl3 = 61 : 1 : 90;
% fr3 = 150 - (sl3 - 61);
% sl = [sl1, sl2, sl3]';
% fr = [fr1, fr2, fr3]';
% a = 80;
% fr = fr + a * rand(length(fr), 1);
% sl0 = sl;
% fr0 = fr;

    % Find the knots (change points) iteratively
%     cut1 = std(sl);    
    nmin = 4;
    rmin = nmin;
    cut1 = 1;   
    
    knots = [];         % Measured in indices, not sound level

    flagExit = 0;
    while(~ flagExit)               
    %     z = zeros(1, length(sl));
        Z = 0;

        if (length(sl) <= nmin)
            break;
        end
        b = [ones(nmin, 1), sl(1 : nmin)] \ fr(1 : nmin);   % b = [intercept; slope];
        rl = 0; % run length.
        pl = 0; % polarity. 1: positive, -1: negative, 0: not in a run.
        rb = 0; % beginning of the run.

        for n = nmin + 1 : 1 : length(sl)        
            rss = sqrt(sum(([ones(n - 1, 1), sl(1 : n - 1)] * b - fr(1 : n - 1)) .^ 2) / (n - 1));  % Residual standard error
            if (rss == 0)    
                z = 0;
            else
                z = (fr(n) - (b(1) + b(2) * sl(n))) / rss / 2; %/ sqrt(1 + (1 + sl(n) ^ 2) / (1 + sl(n -1) ^ 2));
            end
            Z = Z + z;
            
            if (Z > cut1);
                if (pl == 1)
                    rl = rl + 1;
                else
                    rl = 1;
                    pl = 1;
                    rs = n;
                end
            elseif (Z < - cut1);
                if (pl == -1)
                    rl = rl + 1;
                else
                    rl = 1;
                    pl = -1;
                    rs = n;
                end
            else
                rl = 0;
                pl = 0;
            end
            
            if (rl == rmin)
                knots = [knots, length(sl0) - length(sl) + rs];
                sl = sl(rs + 1 : end);
                fr = fr(rs + 1 : end);
                break;
            end
            
            b = [ones(n, 1), sl(1 : n)] \ fr(1 : n);
            if (length(sl)- n < nmin)
                flagExit = 1;
                break;
            end
        end
        
    end
    
%     figure;
%     plot(sl0, fr0); hold on;
%     ym = get(gca, 'YLim');
%     for n = 1 : length(knots)
%         plot(sl0(knots(n)) * ones(1, 100), linspace(ym(1), ym(2), 100));
%     end
        
    % Iterative improvement
    L = length(fr0);
    clear sl;   clear fr;    
    k = length(knots);    % number of inner knots (as in Ertel & Fowlkes (1976))
    

    % Calculate the minimum SSE of each neighboring partition and choose the one
    % with the minimum SSE
    
    if (length(knots) == 0)
        disp('No segmentation.');
        knots_o = []; y_o = []; sse_o = [];
        return
    end
    
    sse_ks = zeros(1, k);   % at this moment, k is the number of inner knots, or equivalently numSeg - 1
    knots_ks = cell(1, k);
    y_ks = cell(1, k);
    
    [knots1, y, minSSE] = iterlm(fr0, knots, nmin);
    knots_ks{k} = knots1;
    y_ks{k} = y;
    sse_ks(k) = minSSE;
    
%     figure;
%     plot(1 : 1 : length(sl0), fr0, 'b.-');  hold on;            
%     plot(1 : 1 : length(sl0), lsn(fr0, knots1, y), 'r-');
    
%     figure;
    while (length(knots1) > 1)
        k = length(knots1);
        sse_cs = zeros(1, k);
        for n = 1 : k
            knots_c = [knots1(1 : n - 1), knots1(n + 1 : end)];
            [knots2, y2, minSSE] = iterlm(fr0, knots_c, nmin);
            sse_cs(n) = minSSE;            
        end
        [junk, nm] = min(sse_cs);
        knots1m = [knots1(1 : nm - 1), knots1(nm + 1 : end)];
        [knots1, y, minSSE] = iterlm(fr0, knots1m, nmin);
        k = k - 1;
        knots_ks{k} = knots1;
        y_ks{k} = y;
        sse_ks(k) = minSSE;
        
        % visualization
        if (toVisualize)
            figure;
            plot(1 : 1 : length(sl0), fr0, 'b.-');  hold on;            
            plot(1 : 1 : length(sl0), lsn(fr0, knots1, y), 'r.-');
            hold off;
            pause;
        end
        % ~ visualization
    end
        
    % Calculate the Cp statistic in section 4.3 of Ertel and Fowlkes (1976)
    kmax = length(sse_ks) + 1;
    sigma2e = sse_ks(end) / (L - 2 * (kmax + 1));
    Cp = sse_ks / sigma2e + (2 : kmax) + 1 - L;
%     figure;plot(Cp / max(Cp));
    
    % Choose the right partition number
    if (~isempty(maxSeg))
        if (length(knots_ks) + 1 > maxSeg)
            knots_ks = knots_ks(1 : maxSeg - 1);
            y_ks = y_ks(1 : maxSeg - 1);
            sse_ks = sse_ks(1 : maxSeg - 1);
        end
    end
    if (isempty(forcedSeg) | forcedSeg > kmax)
        if (max(Cp) < 0)
            kright = 2;
            knots_o = sl0([1, knots_ks{kright - 1}, L]);
            y_o = y_ks{kright - 1}; y_o = y_o';        
            sse_o = sse_ks(kright - 1);
            disp(['kright = ', num2str(kright), '. sse =', num2str(sse_o)]);        
        elseif (min(Cp / max(Cp)) < 0.2)
            kright = min(find(Cp / max(Cp) < 0.2)) + 1;      
            knots_o = sl0([1, knots_ks{kright - 1}, L]);
            y_o = y_ks{kright - 1}; y_o = y_o';
            sse_o = sse_ks(kright - 1);
            disp(['kright = ', num2str(kright), '. sse =', num2str(sse_o)]);
        else
            knots_o = [];
            y_o = [];
            sse_o = [];
            disp('No proper segmentation');
            return;
        end
    else
        kright = forcedSeg;
        knots_o = sl0([1, knots_ks{kright - 1}, L]);
        y_o = y_ks{kright - 1}; y_o = y_o';
        sse_o = sse_ks(kright - 1);
        disp(['kright = ', num2str(kright), '. sse =', num2str(sse_o)]);
    end
    
    if (toPlot)
        figure;
        plot(sl0, fr0, 'b.-'); hold on;
        plot(sl0, lsn(fr0, knots_ks{kright - 1}, y_o), 'r.-');
    end
    
%     toc;
return


function [knots1, ym, minSSE] = iterlm(fr0, knots, nmin);
    L = length(fr0);
    k = length(knots);

    y = solveY(fr0, knots);
    ym = y;
    oldSSE = getSSE(fr0, knots, y);
    flagContinue = 1;
    niter = 0;
    
    while(flagContinue);                
        % Consider all the possible neighboring partitions
        nuknots = zeros(0, length(knots));
        for i1 = 1 : k
            for i2 = [-1, 1];
                nk = knots;
                if (~ (nk(i1) + i2 >= 1 + nmin & nk(i1) + i2 <= L - nmin))
                    continue;
                end
                if (i1 ~= 1)
                    if (nk(i1) + i2 < nk(i1 - 1) + nmin)
                        continue;
                    end
                end
                if (i1 ~= k)
                    if (nk(i1) + i2 > nk(i1 + 1) - nmin)
                        continue;
                    end
                end           
                nk(i1) = nk(i1) + i2;
                nuknots = [nuknots; nk];
            end
        end
        
        sses = zeros(size(nuknots, 1), 1);
%         figure;

        for n = 1 : size(nuknots, 1)
            tk = nuknots(n, :); % tk: the knot in question

            y = solveY(fr0, tk);   

            sses(n) = getSSE(fr0, tk, y);
        end

        [minSSE, ik] = min(sses);

        if (minSSE < oldSSE)
            knots = nuknots(ik, :);
            ym = solveY(fr0, knots);
            flagContinue = 1;
            niter = niter + 1;
            oldSSE = minSSE;
%             disp(['niter = ', num2str(niter), '; minSSE = ', num2str(minSSE)]);     
%             plot(1 : 1 : length(fr0), fr0, 'b.-');  hold on;            
%             plot(1 : 1 : length(fr0), lsn(fr0, knots, ym), 'r.-');   hold off;
%             pause;
        else
            flagContinue = 0;            
        end    
    end 
    knots1 = knots;
%     knots1 = knots;
%     y = solveY(fr0, knots1);
return

function sse = getSSE(fr0, tk, y)
    fr1 = lsn(fr0, tk, y);
    sse = sum((fr1 - fr0) .^ 2);
return

function fr1 = lsn(fr0, tk, y)  % Linear spline based on index
    L = length(fr0);
    fr1 = zeros(size(fr0));
    tk = [1, tk, L];    
    for n = 1 : L
        if (n == 1)
            fr1(n) = y(1);
        elseif (n == L)
            fr1(n) = y(end);
        else
            j = min(find(tk >= n)) - 1;
            fr1(n) = (n - tk(j)) / (tk(j + 1) - tk(j)) * (y(j + 1) - y(j)) + y(j);
        end
    end
return


function y =  solveY(fr0, tk)
    k = length(tk);
    L = length(fr0);
    
    if(size(fr0, 1) < size(fr0, 2)) % That's a row vector, make it into a column vector
        fr0 = fr0';
    end        
    
    a = zeros(1, k + 2);    
    b = zeros(1, k + 1);
    l = zeros(1, k + 2);
    % a, b and l in the normal equation
    a(1) = sum(((tk(1) - (1:tk(1))) / (tk(1) - 1)) .^ 2);
    b(1) = sum((tk(1) - (1:tk(1))) .* ((1:tk(1)) - 1) / ((tk(1) - 1) ^ 2));
    l(1) = sum(fr0(1:tk(1))' .* (tk(1) - (1:tk(1))) / (tk(1) - 1));        
    for m = 2 : k + 1 % Corresponding to the k inner knots
        j = m - 1;

        if (j - 1 == 0 & j + 1 == k + 1)
            a(m) = sum((((1:tk(j)) - 1) / (tk(j) - 1)) .^ 2) + ...
                sum(((L - (tk(j)+1:L)) / (L - tk(j))) .^ 2);
            b(m) = sum((L - (tk(j)+1:L)) .* ((tk(j)+1:L) - tk(j)) / ((L - tk(j)) ^ 2));
            l(m) = sum(fr0(1:tk(j))' .* ((1:tk(j)) - 1) / (tk(j) - 1)) + ...
                sum(fr0(tk(j)+1:L)' .* (L - (tk(j)+1:L)) / (L - tk(j)));            
        elseif (j - 1 == 0)
            a(m) = sum((((1:tk(j)) - 1) / (tk(j) - 1)) .^ 2) + ...
                sum(((tk(j+1) - (tk(j)+1:tk(j+1))) / (tk(j+1) - tk(j))) .^ 2);
            b(m) = sum((tk(j+1) - (tk(j)+1:tk(j+1))) .* ((tk(j)+1:tk(j+1)) - tk(j)) / ((tk(j+1) - tk(j)) ^ 2));
            l(m) = sum(fr0(1:tk(j))' .* ((1:tk(j)) - 1) / (tk(j) - 1)) + ...
                sum(fr0(tk(j)+1:tk(j+1))' .* (tk(j+1) - (tk(j)+1:tk(j+1))) / (tk(j+1) - tk(j)));                
        elseif (j + 1 == k + 1)
            a(m) = sum((((tk(j-1)+1:tk(j)) - tk(j-1)) / (tk(j) - tk(j-1))) .^ 2) + ...
                sum(((L - (tk(j)+1:L)) / (L - tk(j))) .^ 2);
            b(m) = sum((L - (tk(j)+1:L)) .* ((tk(j)+1:L) - tk(j)) / ((L - tk(j)) ^ 2));
            l(m) = sum(fr0(tk(j-1)+1:tk(j))' .* ((tk(j-1)+1:tk(j)) - tk(j-1)) / (tk(j) - tk(j-1))) + ...
                sum(fr0(tk(j)+1:L)' .* (L - (tk(j)+1:L)) / (L - tk(j)));           
        else
            a(m) = sum((((tk(j-1)+1:tk(j)) - tk(j-1)) / (tk(j) - tk(j-1))) .^ 2) + ...
                sum(((tk(j+1) - (tk(j)+1:tk(j+1))) / (tk(j+1) - tk(j))) .^ 2);
            b(m) = sum((tk(j+1) - (tk(j)+1:tk(j+1))) .* ((tk(j)+1:tk(j+1)) - tk(j)) / ((tk(j+1) - tk(j)) ^ 2));
            l(m) = sum(fr0(tk(j-1)+1:tk(j))' .* ((tk(j-1)+1:tk(j)) - tk(j-1)) / (tk(j) - tk(j-1))) + ...
                sum(fr0(tk(j)+1:tk(j+1))' .* (tk(j+1) - (tk(j)+1:tk(j+1))) / (tk(j+1) - tk(j)));
        end            

    end        
    a(k + 2) = sum(((tk(end) - (tk(end)+1:L)) / (L - tk(end))) .^ 2);
    l(k + 2) = sum(fr0(tk(end)+1:L)' .* (tk(end) - (tk(end)+1:L)) / (tk(end) - L));

    A = diag(a) + diag(b, -1) + diag(b, 1);
    y = inv(A) * l';
return
