%Name:		Chris Shoemaker
%Course:	EER-280 - Digital Watermarking
%Project: 	Calculates the PSNR (Peak Signal to Noise Ratio)
%            of images A and A', both of size MxN

function [A] = psnr(image,image_prime,M,N)

    % convert to doubles
    image=double(image);
    image_prime=double(image_prime);

    % avoid divide by zero nastiness
    if ((sum(sum(image-image_prime))) == 0)    
        error('Input vectors must not be identical')
    else
        psnr_num=M*N*max(max(image.^2));                % calculate numerator
        psnr_den=sum(sum((image-image_prime).^2));      % calculate denominator   
        A=psnr_num/psnr_den;                            % calculate PSNR
    end

return

