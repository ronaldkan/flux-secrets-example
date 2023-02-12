encrypt: ./*
	@for foldername in $^ ; do \
			if [ -f "$${foldername}/deploy/production/secrets.yaml" ]; then sops -e -i $${foldername}/deploy/production/secrets.yaml || true; fi; \
			if [ -f "$${foldername}/deploy/staging/secrets.yaml" ]; then sops -e -i $${foldername}/deploy/staging/secrets.yaml || true; fi; \
	done

decrypt: ./*
	@for foldername in $^ ; do \
			if [ -f "$${foldername}/deploy/production/secrets.yaml" ]; then sops -d -i $${foldername}/deploy/production/secrets.yaml || true; fi; \
			if [ -f "$${foldername}/deploy/staging/secrets.yaml" ]; then sops -d -i $${foldername}/deploy/staging/secrets.yaml || true; fi; \
	done
