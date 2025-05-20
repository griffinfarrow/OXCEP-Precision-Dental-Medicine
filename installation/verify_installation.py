import importlib
import sys

REQUIRED_PACKAGES = {
    "numpy": "1.24",
    "scipy": "1.10",
    "pandas": "1.5",
    "sklearn": "1.2",
    "shap": "0.41",
    "lifelines": "0.27",
    "matplotlib": "3.6",
    "notebook": "6.5",
    "jupyterlab": "3.6",
}

errors = []

print("🔍 Verifying required packages...\n")

for pkg, expected_version in REQUIRED_PACKAGES.items():
    try:
        module = importlib.import_module(pkg)
        version = getattr(module, '__version__', 'unknown')
        if not version.startswith(expected_version):
            print(f"⚠️  {pkg} version mismatch: expected {expected_version}, found {version}")
        else:
            print(f"✅ {pkg} is OK (version {version})")
    except ImportError:
        errors.append(pkg)
        print(f"❌ {pkg} is missing!")

if errors:
    print("\nSome required packages are missing!")
    print("Missing:", ", ".join(errors))
    sys.exit(1)
else:
    print("\n✅ All required packages are installed correctly.")
