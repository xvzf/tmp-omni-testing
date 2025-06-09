CLUSTERS := cncf-fra-basic cncf-fra-cilium

all: $(addprefix sync-, $(CLUSTERS))

patches: patches/cilium/cilium.yaml patches/local-path-provisioner/local-path-provisioner.yaml

%.yaml: %.yaml.sh
	bash $<


sync-%: patches
	omnictl cluster template sync -f $*.yaml
