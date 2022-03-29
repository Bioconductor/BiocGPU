gcloud compute instances create test-gpu-scratch \
    --machine-type n1-standard-2 \
    --zone us-central1-a \
    --boot-disk-size 50GB \
    --accelerator type=nvidia-tesla-k80,count=1 \
    --image-project deeplearning-platform-release \
    --image-family common-cu113-ubuntu-2004 \
    --maintenance-policy TERMINATE --restart-on-failure
