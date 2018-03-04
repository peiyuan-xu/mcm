%% PUBLISH example
% This is an example to illustrate how easy it is to create a document
% in the Publish environment.

%(1) This is an illustration of a formula created with a Latex command.
%%
% 
% $$x^2+e^{\pi i} + 1 = 0$$
% 
%(2)This is an illustration of how you cna incorporate a Matlab script
% int the document that is run when the Publish button below and to the 
%right of View is clicked:

% Earth picture
load earth
image(X);colormap(map);
axis image
