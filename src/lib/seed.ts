import type { Subject, Node } from "./types";

// ── Curated launch corpus ────────────────────────────────────────────────
// Unified taxonomy: Subject → Sub-subject → Topic. Generated from the
// Periergia subject taxonomy. This is the STABLE tree (seeded once into
// Supabase — see supabase/seed.sql — and used as the in-memory fallback).

interface NodeSpec {
  title: string;
  summary?: string;
  children?: NodeSpec[];
}

interface SubjectSpec {
  name: string;
  slug: string;
  description: string;
  tree: NodeSpec[];
}

export const SUBJECTS: SubjectSpec[] = [
  {
    "name": "Mathematics",
    "slug": "mathematics",
    "description": "",
    "tree": [
      {
        "title": "Arithmetic & Number",
        "children": [
          {
            "title": "place value"
          },
          {
            "title": "fractions"
          },
          {
            "title": "decimals"
          },
          {
            "title": "ratios"
          },
          {
            "title": "percentages"
          },
          {
            "title": "integers"
          },
          {
            "title": "number theory basics"
          },
          {
            "title": "primes"
          }
        ]
      },
      {
        "title": "Algebra",
        "children": [
          {
            "title": "expressions"
          },
          {
            "title": "equations"
          },
          {
            "title": "inequalities"
          },
          {
            "title": "functions"
          },
          {
            "title": "polynomials"
          },
          {
            "title": "quadratics"
          },
          {
            "title": "sequences & series"
          },
          {
            "title": "matrices"
          }
        ]
      },
      {
        "title": "Geometry",
        "children": [
          {
            "title": "shapes"
          },
          {
            "title": "angles"
          },
          {
            "title": "area & volume"
          },
          {
            "title": "coordinate geometry"
          },
          {
            "title": "transformations"
          },
          {
            "title": "vectors"
          },
          {
            "title": "trigonometry"
          }
        ]
      },
      {
        "title": "Calculus",
        "children": [
          {
            "title": "limits"
          },
          {
            "title": "derivatives"
          },
          {
            "title": "integrals"
          },
          {
            "title": "differential equations"
          },
          {
            "title": "multivariable calculus"
          },
          {
            "title": "series"
          }
        ]
      },
      {
        "title": "Probability & Statistics",
        "children": [
          {
            "title": "descriptive stats"
          },
          {
            "title": "distributions"
          },
          {
            "title": "hypothesis testing"
          },
          {
            "title": "regression"
          },
          {
            "title": "Bayesian methods"
          }
        ]
      },
      {
        "title": "Discrete Mathematics",
        "children": [
          {
            "title": "logic"
          },
          {
            "title": "set theory"
          },
          {
            "title": "combinatorics"
          },
          {
            "title": "graph theory"
          },
          {
            "title": "proof techniques"
          }
        ]
      },
      {
        "title": "Applied Mathematics",
        "children": [
          {
            "title": "linear algebra"
          },
          {
            "title": "numerical methods"
          },
          {
            "title": "optimization"
          },
          {
            "title": "mathematical modeling"
          }
        ]
      }
    ]
  },
  {
    "name": "Physics",
    "slug": "physics",
    "description": "",
    "tree": [
      {
        "title": "Classical Mechanics",
        "children": [
          {
            "title": "kinematics"
          },
          {
            "title": "forces"
          },
          {
            "title": "energy"
          },
          {
            "title": "momentum"
          },
          {
            "title": "rotation"
          },
          {
            "title": "gravitation"
          }
        ]
      },
      {
        "title": "Thermodynamics",
        "children": [
          {
            "title": "heat"
          },
          {
            "title": "temperature"
          },
          {
            "title": "laws of thermodynamics"
          },
          {
            "title": "entropy"
          },
          {
            "title": "kinetic theory"
          }
        ]
      },
      {
        "title": "Electromagnetism",
        "children": [
          {
            "title": "electric fields"
          },
          {
            "title": "circuits"
          },
          {
            "title": "magnetism"
          },
          {
            "title": "Maxwell's equations"
          },
          {
            "title": "electromagnetic waves"
          }
        ]
      },
      {
        "title": "Waves & Optics",
        "children": [
          {
            "title": "sound"
          },
          {
            "title": "light"
          },
          {
            "title": "reflection"
          },
          {
            "title": "refraction"
          },
          {
            "title": "interference"
          },
          {
            "title": "lenses"
          }
        ]
      },
      {
        "title": "Modern Physics",
        "children": [
          {
            "title": "special relativity"
          },
          {
            "title": "quantum mechanics"
          },
          {
            "title": "atomic & nuclear physics"
          },
          {
            "title": "particle physics"
          }
        ]
      },
      {
        "title": "Astrophysics & Cosmology",
        "children": [
          {
            "title": "stars"
          },
          {
            "title": "black holes"
          },
          {
            "title": "the Big Bang"
          },
          {
            "title": "dark matter & energy"
          }
        ]
      }
    ]
  },
  {
    "name": "Chemistry",
    "slug": "chemistry",
    "description": "",
    "tree": [
      {
        "title": "General Chemistry",
        "children": [
          {
            "title": "atoms"
          },
          {
            "title": "periodic table"
          },
          {
            "title": "bonding"
          },
          {
            "title": "stoichiometry"
          },
          {
            "title": "states of matter"
          }
        ]
      },
      {
        "title": "Physical Chemistry",
        "children": [
          {
            "title": "thermochemistry"
          },
          {
            "title": "kinetics"
          },
          {
            "title": "equilibrium"
          },
          {
            "title": "electrochemistry"
          },
          {
            "title": "quantum chemistry"
          }
        ]
      },
      {
        "title": "Organic Chemistry",
        "children": [
          {
            "title": "hydrocarbons"
          },
          {
            "title": "functional groups"
          },
          {
            "title": "reactions"
          },
          {
            "title": "polymers"
          },
          {
            "title": "stereochemistry"
          }
        ]
      },
      {
        "title": "Inorganic Chemistry",
        "children": [
          {
            "title": "transition metals"
          },
          {
            "title": "coordination compounds"
          },
          {
            "title": "solid-state chemistry"
          }
        ]
      },
      {
        "title": "Analytical Chemistry",
        "children": [
          {
            "title": "spectroscopy"
          },
          {
            "title": "chromatography"
          },
          {
            "title": "titration"
          },
          {
            "title": "quantitative analysis"
          }
        ]
      },
      {
        "title": "Biochemistry",
        "children": [
          {
            "title": "proteins"
          },
          {
            "title": "enzymes"
          },
          {
            "title": "metabolism"
          },
          {
            "title": "nucleic acids"
          },
          {
            "title": "cellular chemistry"
          }
        ]
      }
    ]
  },
  {
    "name": "Biology",
    "slug": "biology",
    "description": "",
    "tree": [
      {
        "title": "Cell Biology",
        "children": [
          {
            "title": "cell structure"
          },
          {
            "title": "membranes"
          },
          {
            "title": "organelles"
          },
          {
            "title": "cell cycle"
          },
          {
            "title": "transport"
          }
        ]
      },
      {
        "title": "Genetics",
        "children": [
          {
            "title": "DNA"
          },
          {
            "title": "inheritance"
          },
          {
            "title": "gene expression"
          },
          {
            "title": "mutations"
          },
          {
            "title": "genomics"
          },
          {
            "title": "CRISPR"
          }
        ]
      },
      {
        "title": "Human Anatomy & Physiology",
        "children": [
          {
            "title": "organ systems"
          },
          {
            "title": "homeostasis"
          },
          {
            "title": "nervous & endocrine systems"
          }
        ]
      },
      {
        "title": "Ecology",
        "children": [
          {
            "title": "ecosystems"
          },
          {
            "title": "food webs"
          },
          {
            "title": "populations"
          },
          {
            "title": "biodiversity"
          },
          {
            "title": "conservation"
          }
        ]
      },
      {
        "title": "Evolution",
        "children": [
          {
            "title": "natural selection"
          },
          {
            "title": "speciation"
          },
          {
            "title": "phylogenetics"
          },
          {
            "title": "evidence for evolution"
          }
        ]
      },
      {
        "title": "Microbiology",
        "children": [
          {
            "title": "bacteria"
          },
          {
            "title": "viruses"
          },
          {
            "title": "fungi"
          },
          {
            "title": "immunology basics"
          }
        ]
      },
      {
        "title": "Botany",
        "children": [
          {
            "title": "plant structure"
          },
          {
            "title": "photosynthesis"
          },
          {
            "title": "plant reproduction"
          }
        ]
      },
      {
        "title": "Zoology",
        "children": [
          {
            "title": "animal classification"
          },
          {
            "title": "behavior"
          },
          {
            "title": "comparative physiology"
          }
        ]
      }
    ]
  },
  {
    "name": "Earth & Environmental Science",
    "slug": "earth-and-environmental-science",
    "description": "",
    "tree": [
      {
        "title": "Geology",
        "children": [
          {
            "title": "rocks & minerals"
          },
          {
            "title": "plate tectonics"
          },
          {
            "title": "volcanoes"
          },
          {
            "title": "earthquakes"
          },
          {
            "title": "the rock cycle"
          }
        ]
      },
      {
        "title": "Meteorology & Climate",
        "children": [
          {
            "title": "weather systems"
          },
          {
            "title": "atmosphere"
          },
          {
            "title": "climate change"
          },
          {
            "title": "forecasting"
          }
        ]
      },
      {
        "title": "Oceanography",
        "children": [
          {
            "title": "currents"
          },
          {
            "title": "marine ecosystems"
          },
          {
            "title": "tides"
          },
          {
            "title": "ocean chemistry"
          }
        ]
      },
      {
        "title": "Environmental Science",
        "children": [
          {
            "title": "pollution"
          },
          {
            "title": "sustainability"
          },
          {
            "title": "resources"
          },
          {
            "title": "ecological footprint"
          }
        ]
      },
      {
        "title": "Physical Geography",
        "children": [
          {
            "title": "landforms"
          },
          {
            "title": "rivers"
          },
          {
            "title": "glaciers"
          },
          {
            "title": "soils"
          },
          {
            "title": "biomes"
          }
        ]
      }
    ]
  },
  {
    "name": "Astronomy & Space",
    "slug": "astronomy-and-space",
    "description": "",
    "tree": [
      {
        "title": "Solar System",
        "children": [
          {
            "title": "planets"
          },
          {
            "title": "moons"
          },
          {
            "title": "asteroids"
          },
          {
            "title": "comets"
          },
          {
            "title": "the Sun"
          }
        ]
      },
      {
        "title": "Stars & Galaxies",
        "children": [
          {
            "title": "stellar life cycles"
          },
          {
            "title": "nebulae"
          },
          {
            "title": "galaxy types"
          },
          {
            "title": "the Milky Way"
          }
        ]
      },
      {
        "title": "Cosmology",
        "children": [
          {
            "title": "origins of the universe"
          },
          {
            "title": "expansion"
          },
          {
            "title": "dark matter"
          },
          {
            "title": "multiverse theories"
          }
        ]
      },
      {
        "title": "Space Exploration",
        "children": [
          {
            "title": "rockets"
          },
          {
            "title": "satellites"
          },
          {
            "title": "telescopes"
          },
          {
            "title": "crewed missions"
          },
          {
            "title": "astrobiology"
          }
        ]
      }
    ]
  },
  {
    "name": "Computer Science",
    "slug": "computer-science",
    "description": "",
    "tree": [
      {
        "title": "Programming Fundamentals",
        "children": [
          {
            "title": "variables"
          },
          {
            "title": "control flow"
          },
          {
            "title": "functions"
          },
          {
            "title": "data types"
          },
          {
            "title": "debugging"
          }
        ]
      },
      {
        "title": "Data Structures & Algorithms",
        "children": [
          {
            "title": "arrays"
          },
          {
            "title": "trees"
          },
          {
            "title": "graphs"
          },
          {
            "title": "sorting"
          },
          {
            "title": "searching"
          },
          {
            "title": "complexity"
          }
        ]
      },
      {
        "title": "Software Engineering",
        "children": [
          {
            "title": "version control"
          },
          {
            "title": "testing"
          },
          {
            "title": "design patterns"
          },
          {
            "title": "agile methods"
          }
        ]
      },
      {
        "title": "Web Development",
        "children": [
          {
            "title": "HTML/CSS"
          },
          {
            "title": "JavaScript"
          },
          {
            "title": "frontend frameworks"
          },
          {
            "title": "backend"
          },
          {
            "title": "APIs"
          },
          {
            "title": "databases"
          }
        ]
      },
      {
        "title": "Databases",
        "children": [
          {
            "title": "SQL"
          },
          {
            "title": "relational design"
          },
          {
            "title": "NoSQL"
          },
          {
            "title": "data modeling"
          }
        ]
      },
      {
        "title": "Artificial Intelligence & ML",
        "children": [
          {
            "title": "neural networks"
          },
          {
            "title": "supervised/unsupervised learning"
          },
          {
            "title": "LLMs"
          },
          {
            "title": "computer vision"
          }
        ]
      },
      {
        "title": "Cybersecurity",
        "children": [
          {
            "title": "cryptography"
          },
          {
            "title": "network security"
          },
          {
            "title": "ethical hacking"
          },
          {
            "title": "privacy"
          }
        ]
      },
      {
        "title": "Systems & Networks",
        "children": [
          {
            "title": "operating systems"
          },
          {
            "title": "computer architecture"
          },
          {
            "title": "networking"
          },
          {
            "title": "distributed systems"
          }
        ]
      },
      {
        "title": "Theory of Computation",
        "children": [
          {
            "title": "automata"
          },
          {
            "title": "computability"
          },
          {
            "title": "complexity theory"
          }
        ]
      }
    ]
  },
  {
    "name": "Engineering & Technology",
    "slug": "engineering-and-technology",
    "description": "",
    "tree": [
      {
        "title": "Mechanical Engineering",
        "children": [
          {
            "title": "statics"
          },
          {
            "title": "dynamics"
          },
          {
            "title": "materials"
          },
          {
            "title": "thermodynamics"
          },
          {
            "title": "machine design"
          }
        ]
      },
      {
        "title": "Electrical Engineering",
        "children": [
          {
            "title": "circuits"
          },
          {
            "title": "signals"
          },
          {
            "title": "control systems"
          },
          {
            "title": "power"
          },
          {
            "title": "electronics"
          }
        ]
      },
      {
        "title": "Civil Engineering",
        "children": [
          {
            "title": "structures"
          },
          {
            "title": "materials"
          },
          {
            "title": "geotechnics"
          },
          {
            "title": "transportation"
          },
          {
            "title": "water systems"
          }
        ]
      },
      {
        "title": "Chemical Engineering",
        "children": [
          {
            "title": "reactions"
          },
          {
            "title": "process design"
          },
          {
            "title": "transport phenomena"
          }
        ]
      },
      {
        "title": "Aerospace Engineering",
        "children": [
          {
            "title": "aerodynamics"
          },
          {
            "title": "propulsion"
          },
          {
            "title": "flight mechanics"
          }
        ]
      },
      {
        "title": "Biomedical Engineering",
        "children": [
          {
            "title": "medical devices"
          },
          {
            "title": "biomechanics"
          },
          {
            "title": "imaging"
          }
        ]
      },
      {
        "title": "Robotics & Mechatronics",
        "children": [
          {
            "title": "sensors"
          },
          {
            "title": "actuators"
          },
          {
            "title": "control"
          },
          {
            "title": "automation"
          }
        ]
      },
      {
        "title": "Industrial & Manufacturing",
        "children": [
          {
            "title": "production systems"
          },
          {
            "title": "quality"
          },
          {
            "title": "logistics"
          },
          {
            "title": "operations"
          }
        ]
      }
    ]
  },
  {
    "name": "Medicine & Health",
    "slug": "medicine-and-health",
    "description": "",
    "tree": [
      {
        "title": "Human Body & Physiology",
        "children": [
          {
            "title": "organ systems"
          },
          {
            "title": "homeostasis"
          },
          {
            "title": "biomechanics"
          }
        ]
      },
      {
        "title": "Anatomy",
        "children": [
          {
            "title": "musculoskeletal"
          },
          {
            "title": "cardiovascular"
          },
          {
            "title": "nervous"
          },
          {
            "title": "digestive systems"
          }
        ]
      },
      {
        "title": "Nutrition & Dietetics",
        "children": [
          {
            "title": "macronutrients"
          },
          {
            "title": "metabolism"
          },
          {
            "title": "dietary planning"
          }
        ]
      },
      {
        "title": "Pharmacology",
        "children": [
          {
            "title": "drug action"
          },
          {
            "title": "dosage"
          },
          {
            "title": "interactions"
          },
          {
            "title": "classes of medication"
          }
        ]
      },
      {
        "title": "Pathology & Disease",
        "children": [
          {
            "title": "infections"
          },
          {
            "title": "chronic diseases"
          },
          {
            "title": "diagnostics"
          }
        ]
      },
      {
        "title": "Mental Health",
        "children": [
          {
            "title": "disorders"
          },
          {
            "title": "therapy approaches"
          },
          {
            "title": "wellbeing"
          }
        ]
      },
      {
        "title": "Public Health & Epidemiology",
        "children": [
          {
            "title": "disease spread"
          },
          {
            "title": "prevention"
          },
          {
            "title": "health policy"
          }
        ]
      },
      {
        "title": "First Aid & Clinical Skills",
        "children": [
          {
            "title": "emergency response"
          },
          {
            "title": "patient care basics"
          }
        ]
      }
    ]
  },
  {
    "name": "Psychology",
    "slug": "psychology",
    "description": "",
    "tree": [
      {
        "title": "Cognitive Psychology",
        "children": [
          {
            "title": "memory"
          },
          {
            "title": "attention"
          },
          {
            "title": "perception"
          },
          {
            "title": "decision-making"
          }
        ]
      },
      {
        "title": "Developmental Psychology",
        "children": [
          {
            "title": "childhood"
          },
          {
            "title": "adolescence"
          },
          {
            "title": "aging"
          },
          {
            "title": "attachment"
          }
        ]
      },
      {
        "title": "Social Psychology",
        "children": [
          {
            "title": "attitudes"
          },
          {
            "title": "groups"
          },
          {
            "title": "persuasion"
          },
          {
            "title": "prejudice"
          }
        ]
      },
      {
        "title": "Clinical & Abnormal Psychology",
        "children": [
          {
            "title": "disorders"
          },
          {
            "title": "diagnosis"
          },
          {
            "title": "treatment"
          }
        ]
      },
      {
        "title": "Biological Psychology",
        "children": [
          {
            "title": "brain"
          },
          {
            "title": "neurons"
          },
          {
            "title": "hormones"
          },
          {
            "title": "behavior"
          }
        ]
      },
      {
        "title": "Behavioral Psychology",
        "children": [
          {
            "title": "conditioning"
          },
          {
            "title": "reinforcement"
          },
          {
            "title": "learning theory"
          }
        ]
      },
      {
        "title": "Personality & Individual Differences",
        "children": [
          {
            "title": "traits"
          },
          {
            "title": "intelligence"
          },
          {
            "title": "motivation"
          }
        ]
      }
    ]
  },
  {
    "name": "Sociology & Anthropology",
    "slug": "sociology-and-anthropology",
    "description": "",
    "tree": [
      {
        "title": "Sociological Theory",
        "children": [
          {
            "title": "classical & modern thinkers"
          },
          {
            "title": "French Social Thought",
            "summary": "The French lineage that remade the human sciences: Comte's invention of 'sociology'; Durkheim, the Année sociologique, and social facts; Mauss's The Gift; structuralism — from Saussure's linguistics to Lévi-Strauss's kinship and myth, Barthes's mythologies; the post-structuralist explosion — Foucault's power/knowledge and discipline, Derrida's deconstruction, Deleuze; Bourdieu — habitus, field, cultural capital, Distinction; Beauvoir and French feminism (Irigaray, Kristeva, Wittig); Latour, actor-network theory, and science studies; and the trans-Atlantic career of it all — how 'French Theory' (Cusset) conquered and divided the American academy."
          },
          {
            "title": "key frameworks"
          }
        ]
      },
      {
        "title": "Social Structures",
        "children": [
          {
            "title": "class"
          },
          {
            "title": "family"
          },
          {
            "title": "institutions"
          },
          {
            "title": "inequality"
          }
        ]
      },
      {
        "title": "Culture & Society",
        "children": [
          {
            "title": "norms"
          },
          {
            "title": "values"
          },
          {
            "title": "socialization"
          },
          {
            "title": "subcultures"
          }
        ]
      },
      {
        "title": "Cultural Anthropology",
        "children": [
          {
            "title": "ethnography"
          },
          {
            "title": "kinship"
          },
          {
            "title": "ritual"
          },
          {
            "title": "belief systems"
          }
        ]
      },
      {
        "title": "Archaeology",
        "children": [
          {
            "title": "human origins"
          },
          {
            "title": "artifacts"
          },
          {
            "title": "ancient civilizations"
          }
        ]
      },
      {
        "title": "Social Research Methods",
        "children": [
          {
            "title": "surveys"
          },
          {
            "title": "interviews"
          },
          {
            "title": "qualitative & quantitative analysis"
          }
        ]
      }
    ]
  },
  {
    "name": "Political Science & International Relations",
    "slug": "political-science-and-international-relations",
    "description": "",
    "tree": [
      {
        "title": "Political Theory",
        "children": [
          {
            "title": "democracy"
          },
          {
            "title": "power"
          },
          {
            "title": "justice"
          },
          {
            "title": "ideologies"
          }
        ]
      },
      {
        "title": "Comparative Politics",
        "children": [
          {
            "title": "political systems"
          },
          {
            "title": "elections"
          },
          {
            "title": "institutions"
          }
        ]
      },
      {
        "title": "International Relations",
        "children": [
          {
            "title": "diplomacy"
          },
          {
            "title": "war & peace"
          },
          {
            "title": "global governance"
          }
        ]
      },
      {
        "title": "Public Policy",
        "children": [
          {
            "title": "policy-making"
          },
          {
            "title": "governance"
          },
          {
            "title": "administration"
          }
        ]
      },
      {
        "title": "Geopolitics",
        "children": [
          {
            "title": "borders"
          },
          {
            "title": "resources"
          },
          {
            "title": "regional power"
          },
          {
            "title": "security"
          }
        ]
      }
    ]
  },
  {
    "name": "Economics",
    "slug": "economics",
    "description": "",
    "tree": [
      {
        "title": "Microeconomics",
        "children": [
          {
            "title": "Demand and Supply Analysis",
            "summary": "How prices and quantities are set by the interaction of buyers and sellers — analyzed both from the individual consumer's side and from the firm's side.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "How demand and supply curves determine a market's equilibrium price and quantity, and what shifts each curve."
              },
              {
                "title": "Supply and Demand for Consumers",
                "summary": "Demand and supply from the individual consumer's perspective: how consumers respond to prices, income, and preferences, and how their choices aggregate into market demand."
              },
              {
                "title": "Supply and Demand for Firms",
                "summary": "Demand and supply from the firm's perspective: how a firm decides how much to produce and supply given its costs and market prices."
              }
            ]
          },
          {
            "title": "elasticity"
          },
          {
            "title": "consumer choice"
          },
          {
            "title": "production & costs"
          },
          {
            "title": "breakeven & shutdown"
          },
          {
            "title": "surplus & market interventions"
          },
          {
            "title": "factor markets"
          },
          {
            "title": "market failure & government"
          }
        ]
      },
      {
        "title": "Firms & Market Structures",
        "children": [
          {
            "title": "perfect competition"
          },
          {
            "title": "monopolistic competition"
          },
          {
            "title": "oligopoly"
          },
          {
            "title": "monopoly"
          },
          {
            "title": "economies of scale"
          },
          {
            "title": "The Firm and Market Structures",
            "summary": "How a firm's costs shape its output decisions, and how a market's structure — from perfect competition to monopoly — shapes prices and power.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Breakeven, Shutdown, and Scale"
              },
              {
                "title": "Characteristics of Market Structures"
              },
              {
                "title": "Identifying Market Structures"
              }
            ]
          }
        ]
      },
      {
        "title": "Macroeconomics",
        "children": [
          {
            "title": "Aggregate Output, Prices, and Economic Growth",
            "summary": "The big-picture measures and forces of a national economy — what it produces, the overall price level, and what makes it grow over time.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "The core macroeconomic aggregates — output, income, the price level, and growth — and how they fit together."
              },
              {
                "title": "Aggregate Output and Income Measurement",
                "summary": "How a nation's output and income are measured (GDP and the national income accounts), and why total output equals total income."
              },
              {
                "title": "Aggregate Demand and Supply Analysis",
                "summary": "Using aggregate demand and aggregate supply to explain the level of output, the price level, inflation, and recessions."
              },
              {
                "title": "Economic Growth and Its Determinants",
                "summary": "What drives long-run economic growth — labor, capital, and productivity — and the factors that sustain or constrain it."
              }
            ]
          },
          {
            "title": "inflation"
          },
          {
            "title": "unemployment"
          },
          {
            "title": "Keynesian economics & IS-LM"
          },
          {
            "title": "current economic issues"
          }
        ]
      },
      {
        "title": "Business Cycles",
        "children": [
          {
            "title": "Understanding Business Cycles",
            "summary": "How economies expand and contract over time, and the forces that drive each phase of the cycle.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Business Cycles"
              }
            ]
          },
          {
            "title": "credit cycles"
          },
          {
            "title": "economic indicators"
          },
          {
            "title": "recessions & recoveries"
          }
        ]
      },
      {
        "title": "Money & Policy",
        "children": [
          {
            "title": "money & banking"
          },
          {
            "title": "central banks"
          },
          {
            "title": "Monetary Policy",
            "summary": "How central banks use interest rates and the money supply to steer inflation and growth.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Central Bank Objectives and Tools"
              },
              {
                "title": "Monetary Policy Effects and Limitations"
              }
            ]
          },
          {
            "title": "Fiscal Policy",
            "summary": "How governments use spending and taxation to influence the economy.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Fiscal Policy Objectives"
              },
              {
                "title": "Fiscal Policy Tools and Implementation"
              }
            ]
          },
          {
            "title": "interest rates"
          },
          {
            "title": "stabilization policies & their limits"
          }
        ]
      },
      {
        "title": "Global Economy",
        "children": [
          {
            "title": "International Trade",
            "summary": "Why countries trade, who gains, and how comparative advantage shapes the flow of goods across borders.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "International Trade"
              }
            ]
          },
          {
            "title": "trade restrictions & blocs"
          },
          {
            "title": "Capital Flows and the FX Market",
            "summary": "How money moves between countries, and how currencies are exchanged in the world's largest market.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "The Foreign Exchange Market"
              },
              {
                "title": "Managing Exchange Rates"
              }
            ]
          },
          {
            "title": "Exchange Rate Calculations",
            "summary": "How exchange rates are quoted, and how to compute cross rates and currency returns.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Foreign Exchange Rates"
              }
            ]
          },
          {
            "title": "Introduction to Geopolitics",
            "summary": "How cooperation and rivalry between states shape trade, capital, and markets.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Geopolitics"
              }
            ]
          }
        ]
      },
      {
        "title": "Behavioral Economics",
        "children": [
          {
            "title": "decision-making"
          },
          {
            "title": "biases"
          },
          {
            "title": "incentives"
          }
        ]
      },
      {
        "title": "Development Economics",
        "children": [
          {
            "title": "growth"
          },
          {
            "title": "poverty"
          },
          {
            "title": "inequality"
          }
        ]
      }
    ]
  },
  {
    "name": "Finance",
    "slug": "finance",
    "description": "",
    "tree": [
      {
        "title": "Quantitative Foundations",
        "summary": "The quantitative concepts and techniques used in financial analysis and investment decision-making — the time value of money, rates and returns, descriptive statistics, probability, and portfolio mathematics.",
        "children": [
          {
            "title": "Rates and Returns",
            "summary": "How interest rates and investment returns are defined and measured — the building blocks for comparing any investment.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "What an interest rate is, and the three equivalent ways to read it: as a required rate of return, as a discount rate used to bring future cash flows to the present, and as the opportunity cost of current consumption. An interest rate as the sum of a real risk-free rate plus premiums that compensate investors for bearing distinct types of risk — inflation, default, liquidity, and maturity risk. And how a return is measured over time, including how to calculate it."
              },
              {
                "title": "Interest Rates and Return Measurement"
              },
              {
                "title": "Time-Weighted and Money-Weighted Returns",
                "summary": "The money-weighted rate of return (the IRR of a portfolio's cash flows) and the time-weighted rate of return; how they differ and when each is appropriate; and how to evaluate and compare portfolio performance using these measures — including why time-weighted return is preferred for judging a manager."
              },
              {
                "title": "Common Measures of Return",
                "summary": "Gross vs net, pre-tax vs after-tax, real, and leveraged returns; annualized return measures (converting a return over any period into a comparable annual figure); and continuously compounded returns and how to compute them."
              }
            ]
          },
          {
            "title": "The Time Value of Money in Finance",
            "summary": "Why a dollar today is worth more than a dollar tomorrow, and how to move cash flows through time to value them.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Discounted Cash Flow Valuation",
                "summary": "Calculate and interpret the present value (PV) of fixed-income and equity instruments from their expected future cash flows."
              },
              {
                "title": "Implied Returns and Cash Flow Additivity",
                "summary": "Calculate and interpret the implied return of fixed-income instruments, and the required return and implied growth rate of equity instruments, given price (PV) and cash flows. Explain the cash flow additivity principle, why it underpins the no-arbitrage condition, and how it is used to compute implied forward interest rates, forward exchange rates, and option values."
              }
            ]
          },
          {
            "title": "Statistical Measures of Asset Returns",
            "summary": "How to summarize the distribution of asset returns — its center, spread, shape, and how returns move together.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "How descriptive statistics convey the important attributes of return data — measures of central tendency, location, and dispersion — and introduce the characteristics of a return distribution's shape, including skewness and kurtosis."
              },
              {
                "title": "Central Tendency and Dispersion",
                "summary": "Calculate, interpret, and evaluate measures of central tendency and location, and measures of dispersion, to address an investment problem."
              },
              {
                "title": "Skewness",
                "summary": "Interpret and evaluate the skewness of a return distribution to address an investment problem."
              },
              {
                "title": "Kurtosis",
                "summary": "Interpret and evaluate the kurtosis of a return distribution to address an investment problem."
              },
              {
                "title": "Correlation",
                "summary": "Interpret the correlation between two variables to address an investment problem."
              }
            ]
          },
          {
            "title": "Probability Trees and Conditional Expectations",
            "summary": "Using probability to reason about uncertain outcomes, form expectations, and update beliefs as new information arrives.",
            "children": [
              {
                "title": "Core Concepts",
                "summary": "The essentials of probability theory and how it is applied to quantify risk for investment decision-making — probabilities, expected values, and reasoning about uncertain outcomes."
              },
              {
                "title": "Probability Models",
                "summary": "Formulate an investment problem as a probability tree, and explain and apply conditional expectations in an investment setting."
              },
              {
                "title": "Expected Values",
                "summary": "Calculate expected values, variances, and standard deviations, and apply them to investment problems."
              },
              {
                "title": "Bayes’ Formula",
                "summary": "Calculate and interpret an updated (posterior) probability in an investment setting using Bayes’ formula."
              }
            ]
          },
          {
            "title": "Portfolio Mathematics",
            "summary": "How the returns and risks of individual assets combine into the return and risk of a whole portfolio.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Probability Models for Portfolio Return and Risk",
                "summary": "Calculate and interpret the expected value, variance, standard deviation, covariances, and correlations of portfolio returns."
              }
            ]
          }
        ]
      },
      {
        "title": "Statistical Methods",
        "children": [
          {
            "title": "Estimation and Inference",
            "summary": "How to draw conclusions about a whole population from a sample, and how sample means behave.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Sampling Techniques and the Central Limit Theorem"
              }
            ]
          },
          {
            "title": "Hypothesis Testing",
            "summary": "A formal procedure for using sample evidence to accept or reject a claim about a population.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Hypothesis Testing Basics"
              },
              {
                "title": "Types of Hypothesis Tests"
              }
            ]
          },
          {
            "title": "Parametric and Non-Parametric Tests of Independence",
            "summary": "Testing whether two variables move together, using correlation-based and rank/frequency-based methods.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Tests for Independence"
              }
            ]
          },
          {
            "title": "Simulation Methods",
            "summary": "Modelling uncertain outcomes by generating many random scenarios instead of solving in closed form.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Lognormal Distributions and Simulation Techniques"
              }
            ]
          },
          {
            "title": "Introduction to Linear Regression",
            "summary": "Fitting a straight line to describe how one variable depends on another, then judging how well it fits.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Linear Regression Basics"
              },
              {
                "title": "Analysis of Variance (ANOVA) and Goodness of Fit"
              },
              {
                "title": "Predicted Values and Functional Forms of Regression"
              }
            ]
          },
          {
            "title": "Introduction to Big Data Techniques",
            "summary": "How large, fast, and varied data — and fintech tools — are transforming financial analysis.",
            "children": [
              {
                "title": "Core Concepts"
              },
              {
                "title": "Introduction to Fintech"
              }
            ]
          }
        ]
      },
      {
        "title": "Financial Statement Analysis",
        "children": [
          {
            "title": "Introduction and Analysis Framework",
            "summary": "A general framework for conducting financial statement analysis: what it sets out to answer, the steps from gathering data to drawing conclusions, and how analysts use the statements to judge a company's performance, health, and prospects."
          },
          {
            "title": "Primary Financial Statements",
            "summary": "The primary financial statements — the income statement, the balance sheet, the statement of cash flows, and the statement of changes in equity — what each one shows and how they link together."
          },
          {
            "title": "Financial Reporting Procedures",
            "summary": "How economic transactions flow through the accounting system to become financial statements: the reporting process, the accounting equation, and accrual accounting."
          },
          {
            "title": "Financial Reporting Standards and Disclosures",
            "summary": "The standards that govern financial reporting and disclosure (such as IFRS and US GAAP), why they exist, and how required disclosures let users compare companies and judge quality."
          },
          {
            "title": "Accounting Methods and Their Effects",
            "summary": "How alternative accounting methods and choices — revenue recognition, inventory, depreciation, and off-balance-sheet structures — change the picture the statements paint, and how this can be abused. Use the Enron scandal as the cautionary case: off-balance-sheet entities hid debt and inflated earnings until the company collapsed in 2001, taking auditor Arthur Andersen with it and prompting the Sarbanes-Oxley Act."
          }
        ]
      },
      {
        "title": "Corporate Issuers",
        "summary": "How companies are owned, financed, and governed: the stakeholders a company must balance, corporate governance, how environmental and social factors enter investing (ESG), how firms use leverage, and how they manage working capital to meet short-term needs.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What a corporate issuer is, the main forms of business organization, and how companies raise and allocate capital; and the key players — shareholders, the board, management, creditors, and other stakeholders."
          },
          {
            "title": "Stakeholder Management",
            "summary": "Identifying a company's stakeholders (shareholders, creditors, employees, customers, suppliers, regulators, and the community) and managing their sometimes-competing interests."
          },
          {
            "title": "Corporate Governance",
            "summary": "Corporate governance — the system of controls and incentives that directs a company; the conflicts of interest among managers, shareholders, and other stakeholders, the mechanisms that manage them, and their risks and benefits."
          },
          {
            "title": "ESG Considerations in Investing",
            "summary": "How environmental and social considerations are integrated into investing (ESG), and why they matter to both issuers and investors."
          },
          {
            "title": "Capital Structure and Leverage",
            "summary": "How companies make use of leverage — financing with debt alongside equity — and the benefits and risks of doing so."
          },
          {
            "title": "Working Capital and Liquidity",
            "summary": "How companies manage working capital and liquidity to meet short-term operational needs."
          }
        ]
      },
      {
        "title": "Equity Investments",
        "children": [
          {
            "title": "Characteristics of Equity Securities",
            "summary": "What equity investments are — ownership shares in a company — and their main types and features: common vs preferred stock, voting and ownership rights, and dividends, and how they differ across companies and markets."
          },
          {
            "title": "Security Markets and Indexes",
            "summary": "How security markets are organized, and how security market indexes are constructed, weighted, and used to measure and benchmark market performance."
          },
          {
            "title": "Industry and Company Analysis",
            "summary": "How to analyze an industry and an individual company — competitive position, business model, and value drivers — in order to evaluate an equity security."
          },
          {
            "title": "Equity Valuation Models",
            "summary": "Basic equity valuation models: present-value / dividend discount models, multiplier (multiples) models, and asset-based valuation."
          },
          {
            "title": "Global Equities",
            "summary": "Investing in equities around the world, and how global equity diversification supports longer-term growth and diversification objectives, in exchange for higher volatility than bonds."
          }
        ]
      },
      {
        "title": "Fixed Income",
        "children": [
          {
            "title": "Fixed-Income Securities",
            "summary": "What fixed-income securities are — bonds and other debt instruments — and their key features: issuer, maturity, coupon, principal, seniority, covenants, and embedded options."
          },
          {
            "title": "Fixed-Income Markets",
            "summary": "How fixed-income markets are organized: who issues bonds (governments, corporations, agencies), how they are sold and traded, and the main market sectors and instruments."
          },
          {
            "title": "Valuation of Fixed-Income Securities",
            "summary": "How to calculate the value (price) of a fixed-income security by discounting its expected cash flows, and the drivers of that value — market yields, credit spreads, and the shape of the yield curve."
          },
          {
            "title": "Yield Measures and Bond Returns",
            "summary": "Yield measures (yield to maturity, current yield, spot and forward rates), how to calculate them, and the fundamentals of what drives a bond's total return."
          },
          {
            "title": "Risk Factors",
            "summary": "The main risks of holding bonds — interest rate risk (measured by duration and convexity), credit risk, liquidity risk, and inflation risk — and how they interact. Ground interest rate risk in real episodes such as Paul Volcker's Fed rate hikes around 1980 and the sharp 2022 bond selloff."
          },
          {
            "title": "Securitization and Asset-Backed Securities",
            "summary": "How pools of loans (mortgages, auto loans, credit-card receivables) are packaged into tradable securities — ABS, MBS, and CDOs. Anchor it in the 2007–2008 subprime mortgage crisis, when mispriced mortgage-backed securities and CDOs helped trigger a global financial crisis."
          },
          {
            "title": "Introduction to Credit Analysis",
            "summary": "The basic principles of credit analysis — assessing a borrower's ability and willingness to repay, credit ratings, and yield spreads — illustrated with real defaults and downgrades such as the 2011 US credit-rating downgrade and the Greek and Argentine debt crises."
          }
        ]
      },
      {
        "title": "Derivatives",
        "summary": "Contracts whose value derives from an underlying asset: forwards, futures, swaps, and contingent claims (options). How derivative markets work, how arbitrage keeps prices in line, and why a derivative's price is tied to the price of its underlying.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What a derivative is and how derivative markets work; the two families — forward commitments (forwards, futures, swaps) and contingent claims (options) — and the benefits and risks of using them."
          },
          {
            "title": "Forwards and Futures",
            "summary": "Forward and futures contracts lock in a price today for a transaction later; how futures differ from forwards (exchange-traded, standardized, marked to market daily)."
          },
          {
            "title": "Swaps",
            "summary": "Swaps as a series of forward commitments to exchange cash flows over time, such as interest rate swaps."
          },
          {
            "title": "Contingent Claims (Options)",
            "summary": "Options as contingent claims — the right, but not the obligation, to buy (call) or sell (put) an underlying; their payoffs and basic uses."
          },
          {
            "title": "Arbitrage and Replication",
            "summary": "Arbitrage — a riskless profit from mispricing — and how replicating a derivative's payoff with the underlying plus cash enforces its price under the no-arbitrage condition."
          },
          {
            "title": "Pricing Derivatives from the Underlying",
            "summary": "Why a derivative's price is tied to the price of its underlying asset, using arbitrage, replication, and the cost of carry."
          }
        ]
      },
      {
        "title": "Alternative Investments",
        "summary": "Assets beyond public stocks and bonds — private equity, hedge funds, real estate, commodities, and infrastructure — and why investors use them: diversification (returns that don't move in lockstep with public markets) and the potential for higher returns, in exchange for less liquidity, higher fees, and greater complexity.",
        "children": [
          {
            "title": "Core Concepts",
            "summary": "What counts as an alternative investment and how it differs from traditional stocks and bonds; the main categories (private equity, hedge funds, real estate, commodities, infrastructure); and the case for holding them — diversification and the potential for higher returns, weighed against illiquidity, higher fees, leverage, and valuation difficulty."
          },
          {
            "title": "Private Equity"
          },
          {
            "title": "Hedge Funds"
          },
          {
            "title": "Real Estate"
          },
          {
            "title": "Commodities and Natural Resources"
          },
          {
            "title": "Infrastructure"
          }
        ]
      },
      {
        "title": "Portfolio Planning and Wealth Management",
        "summary": "The fundamentals of portfolio and risk management — measuring return and risk, planning and constructing a portfolio — and how the needs of individual and institutional investors shape the investment solutions they choose.",
        "children": [
          {
            "title": "Portfolio Management Overview",
            "summary": "The fundamentals of portfolio and risk management: why investors hold diversified portfolios rather than single assets, the portfolio approach to return and risk, and the steps of the portfolio management process."
          },
          {
            "title": "Return and Risk Measurement",
            "summary": "How to measure a portfolio's return and its risk — expected return, variance and standard deviation — and how combining assets changes overall risk through diversification and correlation."
          },
          {
            "title": "Portfolio Risk and Return",
            "summary": "The trade-off between risk and return, how diversification reduces risk, and the efficient frontier. How the capital asset pricing model (CAPM) prices risk and is used to identify the optimal level of risk in a portfolio (the tangency/market portfolio and the security market line)."
          },
          {
            "title": "Portfolio Planning and Construction",
            "summary": "Turning an investor's goals and constraints into a real portfolio: the investment policy statement (IPS), risk tolerance and objectives, and strategic asset allocation."
          },
          {
            "title": "Retail vs Institutional Investors",
            "summary": "The basics — a retail (individual) investor manages their own or their household's money; an institutional investor (pension funds, endowments, insurers, sovereign wealth funds, mutual and hedge funds) invests large pools on behalf of others. How their goals, time horizons, resources, and interests diverge — vividly illustrated by the January 2021 GameStop short squeeze, when retail investors coordinating on Reddit's r/WallStreetBets drove the stock up and squeezed institutional hedge funds (such as Melvin Capital) that had shorted it."
          },
          {
            "title": "Investment Solutions",
            "summary": "The range of available investment solutions — from individual stocks and bonds to mutual funds, ETFs, separately managed accounts, and alternatives — and how each fits different investors' needs and constraints."
          }
        ]
      },
      {
        "title": "Ethics and Professional Standards",
        "children": [
          {
            "title": "The Role of Ethics and Professionalism",
            "summary": "Why ethics and professionalism are central to the investment industry: how trust underpins the profession, how ethical conduct differs from merely legal conduct, and what professionalism demands of practitioners."
          },
          {
            "title": "Challenges to Ethical Behavior",
            "summary": "Why even well-intentioned people act unethically — situational pressures, incentives, overconfidence, and the gap between how we expect to behave and how we actually do."
          },
          {
            "title": "A Framework for Ethical Decision-Making",
            "summary": "A structured, repeatable process for working through ethical dilemmas: identify the issue and stakeholders, weigh options and consequences, decide, act, and reflect."
          },
          {
            "title": "Industry Standards of Conduct",
            "summary": "The standards of professional conduct that govern behavior in the investment industry, and how they guide real day-to-day decisions."
          }
        ]
      },
      {
        "title": "Finance & Capital Markets",
        "children": [
          {
            "title": "stocks & bonds"
          },
          {
            "title": "funds & investment vehicles"
          },
          {
            "title": "financial statements"
          },
          {
            "title": "housing & mortgages"
          }
        ]
      }
    ]
  },
  {
    "name": "Business & Management",
    "slug": "business-and-management",
    "description": "",
    "tree": [
      {
        "title": "Management",
        "children": [
          {
            "title": "leadership"
          },
          {
            "title": "organizational behavior"
          },
          {
            "title": "strategy"
          },
          {
            "title": "operations"
          }
        ]
      },
      {
        "title": "Marketing",
        "children": [
          {
            "title": "branding"
          },
          {
            "title": "consumer behavior"
          },
          {
            "title": "digital marketing"
          },
          {
            "title": "market research"
          }
        ]
      },
      {
        "title": "Accounting",
        "children": [
          {
            "title": "financial statements"
          },
          {
            "title": "bookkeeping"
          },
          {
            "title": "auditing"
          },
          {
            "title": "managerial accounting"
          }
        ]
      },
      {
        "title": "Finance",
        "children": [
          {
            "title": "investment"
          },
          {
            "title": "valuation"
          },
          {
            "title": "corporate finance"
          },
          {
            "title": "markets"
          },
          {
            "title": "risk"
          }
        ]
      },
      {
        "title": "Entrepreneurship",
        "children": [
          {
            "title": "startups"
          },
          {
            "title": "business models"
          },
          {
            "title": "funding"
          },
          {
            "title": "product-market fit"
          }
        ]
      },
      {
        "title": "Human Resources",
        "children": [
          {
            "title": "recruitment"
          },
          {
            "title": "training"
          },
          {
            "title": "compensation"
          },
          {
            "title": "workplace culture"
          }
        ]
      },
      {
        "title": "Project Management",
        "children": [
          {
            "title": "planning"
          },
          {
            "title": "scheduling"
          },
          {
            "title": "agile"
          },
          {
            "title": "risk management"
          }
        ]
      }
    ]
  },
  {
    "name": "Law",
    "slug": "law",
    "description": "",
    "tree": [
      {
        "title": "Legal Systems",
        "children": [
          {
            "title": "common law"
          },
          {
            "title": "civil law"
          },
          {
            "title": "sources of law"
          },
          {
            "title": "Law and Colonialism (Colonial Law)",
            "summary": "The relationship between law and colonialism in Latin America, Africa, and Asia, in both the early modern and the modern period: how law facilitated colonialism — doctrines of discovery and terra nullius, papal bulls and colonial charters, the chartered companies — and how it limited it, from the School of Salamanca (Vitoria, Las Casas) debating empire's legality to metropolitan courts and abolition; how colonialism in turn modified the legal systems that existed previously — legal pluralism, the codification and invention of 'customary law', Hindu and Islamic law under the Raj, indirect rule; law as a political, religious, social, and economic agent — property and land-tenure regimes, labor codes, personal-status and caste law, missionary justice; the legal arena as a sphere for conflict resolution, negotiation, and identity formation — colonial courts as sites where subjects litigated, jurisdictional politics and forum shopping; read through the seminal works — Benton's Law and Colonial Cultures, Chanock's Law, Custom and Social Order, Cohn, Merry, the Comaroffs — down to the postcolonial legacies in today's mixed legal systems."
          },
          {
            "title": "American Legal History",
            "summary": "Law as America's language of power: the colonial reception of the common law; the founding — the Constitution, Marshall's court, and judicial review (Marbury); slavery in law — from the fugitive slave clauses to Dred Scott — and the Reconstruction Amendments' transformation; the Gilded Age courts, Lochner, and the freedom-of-contract era; legal realism and the New Deal settlement (the 1937 'switch in time'); Brown v. Board and the Warren Court's rights revolution; the conservative legal movement, originalism versus the living Constitution; and the profession itself — lawyers, Langdell's law school, and the bar's gatekeeping — as a history of who gets to speak law."
          },
          {
            "title": "Law and Social Change: How Reform Movements Leverage the Law",
            "summary": "How reform movements leverage the law — and when law delivers: the NAACP Legal Defense Fund's decades-long test-case road to Brown v. Board; legal mobilization theory (McCann) against Rosenberg's Hollow Hope skepticism about courts producing change; the campaigns — civil rights, the women's movement (Ginsburg's ACLU litigation strategy), LGBTQ rights from Lawrence to Obergefell, disability rights and the ADA, environmental litigation; cause lawyering and rights consciousness; the global repertoire — public interest litigation in India, South Africa's constitutional cases; and the recurring pattern of victory, backlash, and the long game between courtroom and street."
          },
          {
            "title": "courts"
          }
        ]
      },
      {
        "title": "Constitutional Law",
        "children": [
          {
            "title": "rights"
          },
          {
            "title": "government structure"
          },
          {
            "title": "judicial review"
          }
        ]
      },
      {
        "title": "Criminal Law",
        "children": [
          {
            "title": "offenses"
          },
          {
            "title": "defenses"
          },
          {
            "title": "procedure"
          },
          {
            "title": "evidence"
          }
        ]
      },
      {
        "title": "Civil Law",
        "children": [
          {
            "title": "contracts"
          },
          {
            "title": "torts"
          },
          {
            "title": "property"
          },
          {
            "title": "family law"
          }
        ]
      },
      {
        "title": "International Law",
        "children": [
          {
            "title": "treaties"
          },
          {
            "title": "human rights"
          },
          {
            "title": "humanitarian law"
          },
          {
            "title": "Immigration Law",
            "summary": "The law of who may enter, stay, and belong: citizenship and naturalization; visas, borders, and the machinery of admission; deportation and removal; asylum and refugee law — the 1951 Refugee Convention and the principle of non-refoulement; statelessness; family reunification and labor migration; the American arc — the Chinese Exclusion Act (1882), the 1924 national-origins quotas, the INA (1952), Hart-Celler (1965), IRCA (1986), and the plenary power doctrine; European counterparts — free movement, Schengen, and the Dublin asylum system; and the enduring tension between sovereign control of borders and individual rights."
          }
        ]
      },
      {
        "title": "Business & Commercial Law",
        "children": [
          {
            "title": "company law"
          },
          {
            "title": "intellectual property"
          },
          {
            "title": "employment"
          }
        ]
      }
    ]
  },
  {
    "name": "History",
    "slug": "history",
    "description": "",
    "tree": [
      {
        "title": "What is History?",
        "summary": "What historians study, how they know it, and where 'history' begins: written history opens only about six thousand years ago, with the invention of writing in Sumer (cuneiform, c. 3200 BCE) — so what about the tens of thousands of years of human existence described by archaeology? The Paleolithic longue durée, behavioral modernity and cave art, the migrations out of Africa, and the Neolithic revolution, known through artifacts, oral tradition, genetics, and climate proxies rather than texts; the history/prehistory divide and why 'deep history' and 'big history' challenge it; and the historian's craft — primary sources, evidence and interpretation, bias and perspective, from Herodotus and Thucydides through Ranke's archives to E. H. Carr's What is History? and the question of whether objective history is possible."
      },
      {
        "title": "Ancient History",
        "children": [
          {
            "title": "Mesopotamia"
          },
          {
            "title": "Egypt",
            "summary": "Three thousand years of the Nile's civilization: unification under Narmer (c. 3100 BCE) and the divine kingship of the pharaohs; the Old Kingdom and the pyramids of Giza; the Middle Kingdom; the New Kingdom's imperial age — Hatshepsut, Akhenaten's religious revolution, Tutankhamun, Ramesses II and Kadesh; religion and the afterlife — mummification, the Book of the Dead, the gods of the Egyptian pantheon; hieroglyphs, the Rosetta Stone, and Champollion's decipherment; the Nile's flood rhythm as the economy's engine; Egypt in Africa — Nubia and the Kingdom of Kush, whose pharaohs ruled Egypt as the 25th Dynasty; the Late Period, the Ptolemies, and Cleopatra; and Egypt's afterlives — Egyptology, Egyptomania, and the debate over the Africanness of Egypt, from Cheikh Anta Diop and the 1974 UNESCO Cairo symposium to Bernal's Black Athena controversy."
          },
          {
            "title": "Greece"
          },
          {
            "title": "Rome and the Ancient Roman World",
            "summary": "From city-state to world empire: the republic and its institutions — SPQR, consuls, senate, tribunes; the Punic Wars and Hannibal; the republic's collapse — the Gracchi, Marius and Sulla, Caesar and the crossing of the Rubicon; Augustus and the principate; the Pax Romana and the empire at its height — roads, aqueducts, concrete, cities from Britain to Syria; Roman law from the Twelve Tables to Justinian's codification; slavery, spectacle, and the gladiators; women and the family; the rise of Christianity from persecution to Constantine; and the crisis of the third century opening onto the empire's fall (continued in The Fall of the Roman Empire)."
          },
          {
            "title": "The Fall of the Roman Empire",
            "summary": "Why the ancient world's superpower came apart: the Crisis of the Third Century; Diocletian's and Constantine's reorganizations and the East-West division; pressure on the frontiers — the Goths' victory at Adrianople (378), Alaric's sack of Rome (410), the Vandal sack (455), and Attila's Huns; the deposition of Romulus Augustulus by Odoacer in 476; why the Eastern empire endured another thousand years; and the great debate over causes — Gibbon's classic account, overextension, plague and economic decline, the Christianity thesis, and the modern argument between 'transformation' (Peter Brown's late antiquity) and 'catastrophe' (Bryan Ward-Perkins)."
          },
          {
            "title": "early civilizations"
          }
        ]
      },
      {
        "title": "Medieval History",
        "children": [
          {
            "title": "Early Medieval History",
            "summary": "Europe and the Mediterranean from the fall of the Western Roman Empire (476) to about 1000: the barbarian successor kingdoms (Franks, Visigoths, Ostrogoths, Anglo-Saxons); Byzantium under Justinian and the survival of Roman law; the rise of Islam and the Arab conquests; the spread of Christianity and monasticism (Benedict, Irish and Anglo-Saxon missionaries); the Merovingians and Carolingians, Charlemagne's coronation in 800 and the Carolingian Renaissance; the Treaty of Verdun (843); the Viking, Magyar, and Saracen invasions; and why historians now reject the label 'Dark Ages'."
          },
          {
            "title": "Byzantine Civilization: the Greek Tradition (300–1500)",
            "summary": "The Eastern Roman Empire and the Greek tradition it carried across twelve centuries, from late antiquity to the end of the Middle Ages (c. 300–1500) — including the identity question at its heart: a people who called themselves Romans (Romaioi), were labeled 'Greeks' by the medieval West, and became 'Byzantine' only through modern historians — what 'Roman' and 'Greek' actually meant to them (Kaldellis's Romanland and the current debate): Constantine's founding of Constantinople; Justinian and Theodora — the Corpus Juris Civilis, Hagia Sophia, and the attempted reconquest of the West; Greek fire and the Arab sieges; Iconoclasm; the Macedonian renaissance and Basil II; the conversion of the Slavs (Cyril and Methodius) and the Orthodox commonwealth; the Great Schism of 1054; Manzikert (1071) and the appeal that launched the Crusades; the Fourth Crusade's sack of Constantinople (1204) and the Palaiologan twilight; the fall to Mehmed II in 1453; the society of the Eastern Roman Empire in the Middle Ages — Constantinopolitans and provincials, elites and people of lower social status: the court and the great families, but also peasants, artisans, merchants, soldiers, monks and nuns, women, and eunuchs, glimpsed through saints' lives, letters, and the Book of the Eparch; the Greek intellectual and religious tradition throughout — the Cappadocian Fathers and Chrysostom, John of Damascus and iconophile theology, Photios and the copying that preserved classical Greek literature, Psellos, hesychasm and Gregory Palamas; and Byzantium's legacy — Roman law, Orthodox Christianity, and the scholars and manuscripts (Plethon, Bessarion) that carried Greek learning to Renaissance Italy."
          },
          {
            "title": "feudalism",
            "summary": "The web of lordship that organized medieval power: lords, vassals, fiefs, homage and fealty; knights, chivalry, and the castle; manorialism and serfdom as the economic base; the fragmentation of public authority after the Carolingians; the Church within feudal society; feudal monarchy and its slow reassertion (Domesday England, Capetian France); the system's decline with money, towns, plague, and gunpowder states; and the historians' quarrel — from Marc Bloch's classic account to Elizabeth A. R. Brown's and Susan Reynolds's challenge to the very concept of 'feudalism'."
          },
          {
            "title": "urban institutions",
            "summary": "The medieval town as a laboratory of self-government: the revival of towns from the eleventh century; charters, communes, and the fight for autonomy; merchant and craft guilds — apprenticeship, quality control, monopoly; town councils, mayors, and citizenship ('town air makes free'); markets and fairs (Champagne) and the commercial revolution; the Hanseatic League; the Italian city-republics — Venice, Genoa, Florence; universities (Bologna, Paris, Oxford) as urban corporations; hospitals, confraternities, and cathedral-building; and how urban institutions incubated law, finance, and representative practices that outlived the Middle Ages."
          },
          {
            "title": "empires"
          },
          {
            "title": "The Middle Ages (medieval period)",
            "summary": "Europe c. 500–1500 as one arc: the early, high, and late medieval periods; manorialism and feudal bonds; the power of the Church — papacy, monasteries, the Investiture Controversy; the medieval agricultural revolution, the growth of towns, guilds, and universities; scholasticism (Aquinas); cathedrals and Gothic art; the Black Death (1347–51) and its social aftershocks; the Hundred Years' War and peasant revolts; and the late-medieval crises that shaded into the Renaissance."
          },
          {
            "title": "Sex, Love, and Marriage in the Middle Ages",
            "summary": "Intimacy under God's law: how the Church made marriage — the consent doctrine, indissolubility, and Fourth Lateran's rules; clerical celibacy and its enforcement; courtly love from the troubadours to the romances, and the debate over what it really was; the great lovers — Abelard and Heloise's letters; women's voices — Margery Kempe's negotiated celibacy, Christine de Pizan; peasant versus noble marriage — dowry, land, and strategy; the regulation of prostitution; medicine's ideas about sex and reproduction; same-sex desire and the Boswell debate; annulment as medieval divorce; and how these medieval frameworks still echo in modern marriage."
          },
          {
            "title": "The Crusades",
            "summary": "Two centuries of holy war and their long shadow: Urban II's call at Clermont (1095); the First Crusade and the capture of Jerusalem (1099); the crusader states; Saladin, Hattin, and the Third Crusade with Richard the Lionheart (1187–92); the Fourth Crusade's sack of Constantinople (1204); the military orders — Templars and Hospitallers; the wider crusading world (the Reconquista, the Baltic crusades); the fall of Acre (1291); and the consequences for Christian-Muslim-Jewish relations, trade, and historical memory down to today."
          },
          {
            "title": "Constantinople",
            "summary": "The city that was an empire's argument: Byzantium refounded as Constantine's New Rome (330); the Theodosian Walls that turned back a thousand years of sieges; Hagia Sophia and Justinian's 'Solomon, I have outdone thee'; the Hippodrome, the factions, and the ceremonial city; the harbors, the Golden Horn's chain, and the grain fleets; Greek fire against the Arab sieges; the city of relics and icons; 1204 — the Fourth Crusade's sack and the Latin interlude; the Palaiologan twilight; 29 May 1453 — Mehmed II, the great cannon, and the fall; and the afterlives — Ottoman Kostantiniyye and Istanbul, and Constantinople as memory in the Orthodox world."
          },
          {
            "title": "Political Debates in the Empire of New Rome",
            "summary": "Political thought and argument in Byzantium, the Empire of New Rome: Constantinople as New Rome and the imperial ideology built on it — Eusebius's Christian kingship, taxis (order) and oikonomia (accommodation); how far the empire remained a republic of the Romans (Kaldellis's monarchy-versus-republic debate); the people's politics — the circus factions and the Nika riot (532); iconoclasm as the empire's greatest political-theological argument; emperor and patriarch — symphonia and its breakdowns (Chrysostom's exile, the Photian schism); court rhetoric, advice literature, and panegyric as political speech; and the late debates — union with Rome versus Orthodox integrity, and Plethon's radical Hellenism on the eve of 1453."
          },
          {
            "title": "Slavery in the global Middle Ages",
            "summary": "Bondage between antiquity and the Atlantic system: the post-Roman slaveries of Europe and the Viking slave trade (Dublin's markets, the routes to the east that gave 'Slav' to 'slave'); the Mediterranean traffic of Venice, Genoa, and the Black Sea; the trans-Saharan, Red Sea, and Indian Ocean trades; military slavery and its paradoxes — the Mamluks who ruled Egypt, the Ottoman devshirme; slavery in law and religion — church, ulama, and the ransoming orders; the blurred line between serfdom and slavery; and how these medieval systems set patterns the Atlantic world would industrialize."
          },
          {
            "title": "Islamic Caliphate",
            "summary": "The institution that led the Islamic world for thirteen centuries: the succession to Muhammad (632) and the Rashidun caliphs; the Sunni-Shia split and Karbala (680); the Umayyads in Damascus and the conquests from Spain to Central Asia (Tours, 732); the Abbasids in Baghdad (762) and the House of Wisdom; rival caliphates in Córdoba and Fatimid Cairo; the Mongol sack of Baghdad (1258); the Ottoman claim to the caliphate; its abolition by Atatürk in 1924; and the caliphate as an idea in modern Islamic and Islamist politics."
          },
          {
            "title": "Medieval Islamic Commercial Revolution (800-1200 CE)",
            "summary": "The world's first great commercial integration — a moment of globalization before globalization — centered on the Islamic lands from Baghdad to al-Andalus: the rise of new trade routes extending across land and sea to join the Mediterranean and the Indian Ocean, North and Sub-Saharan Africa, Central and South Asia; the development of novel commercial and financial institutions — the suftaja (bill of exchange), sakk (cheque), qirad/commenda investment partnerships, and funduq caravanserais; gold dinars and silver dirhams as world currencies (found from Scandinavia to China); the merchants who brought about this historic transformation — the merchant diasporas and partnerships glimpsed in the Cairo Geniza's extraordinary record of Jewish and Muslim traders (Goitein); the commodities — textiles, paper (which spread from Samarkand westward), spices, slaves, gold; the forms of labor and investment that undergirded this transformation — caravan porters, sailors, enslaved labor, and pooled merchant capital; market institutions, hisba regulation, and Islamic commercial law; the urban boom of Baghdad, Cairo, and Córdoba; and the debate over how this commercial revolution prefigured — and shaped — Europe's later one."
          },
          {
            "title": "Islamic golden age"
          }
        ]
      },
      {
        "title": "Early Modern History",
        "children": [
          {
            "title": "The Renaissance",
            "summary": "The rebirth that made the modern West's self-image: humanism from Petrarch to civic humanism; Florence and Medici patronage; the artistic revolution — Brunelleschi's dome and perspective, Donatello, Leonardo, Michelangelo, Raphael, Titian; Gutenberg's printing press and the spread of learning; Machiavelli's The Prince and new political thought; the Northern Renaissance — Erasmus, More, Dürer; women and the querelle des femmes; courts, diplomacy, and the Italian Wars; and the historiographical debate from Burckhardt's 'discovery of the individual' to modern revisions."
          },
          {
            "title": "European Expansion Overseas (Age of Exploration)",
            "summary": "How Europe reached, mapped, and seized much of the globe (c. 1415–1600): motives — God, gold, and glory; Portuguese navigation down the African coast, Dias, and da Gama's sea route to India; Columbus (1492) and the Treaty of Tordesillas (1494); Magellan's circumnavigation; the conquests of the Aztec and Inca empires (Cortés, Pizarro) and why they succeeded — steel, horses, allies, and above all disease; Portugal's trading-post empire in Asia; the Spanish colonial system; the Dutch and English East India companies; and the demographic catastrophe and global connections that expansion set in motion."
          },
          {
            "title": "The Protestant and Catholic Reformations",
            "summary": "The shattering of Latin Christendom: Luther's Ninety-five Theses (1517), justification by faith, and the printing press; Zwingli, the radical reformation, and Calvin's Geneva; Henry VIII and the English Reformation; the Catholic (Counter-) Reformation — the Council of Trent, Ignatius Loyola and the Jesuits, the Roman Inquisition and the Index, baroque piety; the wars of religion — the Schmalkaldic War and the Peace of Augsburg, the French wars and St. Bartholomew's Day (1572), the Dutch Revolt, and the Thirty Years' War ending at Westphalia (1648); and the Reformations' legacies for literacy, conscience, and the state."
          },
          {
            "title": "the Scientific Revolution",
            "summary": "The remaking of knowledge itself (c. 1543–1727): Copernicus's heliocentrism; Tycho's observations and Kepler's laws; Galileo — the telescope, mechanics, and the 1633 trial; Vesalius and Harvey in medicine; Bacon's empiricism and Descartes's mechanical philosophy; Newton's Principia (1687) uniting heavens and earth; the new institutions — the Royal Society (1660) and the Académie des sciences — and instruments, experiment, and mathematization as method; alchemy, astrology, and religion entangled with the new science; and the revolution's link forward to the Enlightenment and the debate over whether 'revolution' is the right word."
          },
          {
            "title": "The Rise of Absolutism",
            "summary": "The early modern state's claim to total sovereignty: divine-right theory (Bodin, Bossuet, Hobbes's Leviathan); Richelieu, Mazarin, and the Fronde; Louis XIV — Versailles, court society, standing armies, Colbert's mercantilism, and the revocation of the Edict of Nantes; the military revolution and the fiscal-military state; Hohenzollern Prussia and the Great Elector; Peter the Great's transformation of Russia; the Habsburgs; and the English exception — civil war, the execution of Charles I, and the Glorious Revolution of 1688 that entrenched parliamentary limits absolutism could not cross."
          },
          {
            "title": "new world economy",
            "summary": "How the encounter of hemispheres created the first global economy: the Columbian exchange of crops, animals, and diseases; Potosí and the silver flows that tied the Americas to Spain and China; the sugar revolution and the plantation complex; encomienda, coerced Indigenous labor, and the turn to African slavery; mercantilism, navigation acts, and the triangular trade; the Price Revolution in Europe; the commercial institutions born of Atlantic trade — joint-stock companies, marine insurance, the Amsterdam exchange; and how the New World economy transformed Europe, Africa, and the Americas alike."
          },
          {
            "title": "The Ottomans",
            "summary": "The empire that bridged three continents for six centuries (c. 1299–1922), beginning with the emergence of the Ottoman state from a frontier principality into a world empire in its social, political, and cultural dimensions: pre-Ottoman Anatolia — the Seljuks, the beyliks, and the post-Mongol vacuum; frontier (gazi) society and its fluid Muslim-Christian world; methods of conquest — accommodation, vassalage, and istimalet as much as the sword; centralization and the institutionalization of power under Mehmed II; the land regime (timar) and the peasantry; urbanization and the remaking of conquered cities; intercommunal relations; religion and learning — the medreses and the ulema; architecture and literature from early Bursa to Sinan; and relations with Byzantium and the Islamic and European states throughout; then Mehmed II's conquest of Constantinople (1453); Suleiman the Magnificent — lawgiver, Vienna (1529), and the empire's classical age; the devshirme and the Janissaries; the millet system and religious pluralism; Lepanto (1571) and the contest for the Mediterranean; the second siege of Vienna (1683) and the long territorial retreat; the Tanzimat reforms and the 'sick man of Europe'; the Young Turks, the Balkan Wars, the First World War and the Armenian genocide; and the empire's dissolution into Atatürk's republic."
          },
          {
            "title": "Ottoman Social and Cultural History",
            "summary": "The Ottoman world from the inside: Istanbul's neighborhoods, markets, and waterfront; the coffeehouse revolution and the state's futile bans; the imperial harem and the 'sultanate of women' (Peirce); guilds, janissary-artisans, and urban protest; the Sufi orders and popular religion; everyday life in the millets — Greek, Armenian, Jewish, and Arab provincial worlds; slavery as lived institution; the long delay and arrival of Ottoman print (Müteferrika, 1727); Tanzimat-era cultural transformation — newspapers, photography, the fez; and how social history revises the old decline narrative."
          },
          {
            "title": "Atlantic Slave Wars",
            "summary": "The violence that made and unmade Atlantic slavery, c. 1500–1888: the transatlantic slave trade and the African wars and raiding that supplied it (Dahomey, Asante, the Kongo civil wars); the Middle Passage and shipboard revolts (the Amistad, 1839); maroon communities and their wars — Palmares in Brazil, Jamaica's First and Second Maroon Wars; the great uprisings — Stono (1739), Tacky's Revolt (1760), the Haitian Revolution (1791–1804, the only successful slave revolution, Toussaint Louverture), Demerara (1823), and the Baptist War in Jamaica (1831–32); how rebellion pushed abolition — Britain's 1807 trade ban and 1833 emancipation, the Royal Navy's suppression squadron; and emancipation's long endgame through the US Civil War to Brazil in 1888."
          },
          {
            "title": "revolutions",
            "summary": "Revolution as the engine of modern history: the Atlantic age of revolutions — American, French, Haitian, and the Spanish American independence wars (Bolívar, San Martín); 1848, the springtime of peoples, and its failures; the twentieth century's great revolutions — Russian, Chinese, Cuban, Iranian; what makes a revolution and how they run — radicalization, terror, Thermidor, restoration; the theorists from Tocqueville to Arendt to Skocpol; and the word's wider reach — industrial, scientific, and cultural revolutions — as a lens on transformative change."
          },
          {
            "title": "French and Haitian Revolutions",
            "summary": "The intertwined revolutions that redefined liberty — and exposed its limits: France 1789 — the Estates-General, the Bastille, the Declaration of the Rights of Man, the radical Republic and the Terror (Robespierre), Thermidor, and Napoleon; Saint-Domingue 1791 — the great slave uprising, Toussaint Louverture, the 1794 abolition, Napoleon's attempt to restore slavery, and Dessalines's declaration of Haitian independence (1804), the first Black republic; how each revolution forced the other's contradictions into the open (revolutionary universalism versus colonial slavery); Haiti's crushing 1825 indemnity to France; and both revolutions' global echoes through the Atlantic world and Latin America."
          },
          {
            "title": "Declarations of Independence: the American Revolution",
            "summary": "How thirteen colonies became a republic (1763–1789), starting from the causes: the constitutional, legal, economic, social, and political issues that prompted the imperial crisis after the Seven Years' War and resulted in the colonies' decision to break with Great Britain — parliamentary sovereignty versus colonial charters, taxation without representation, the Stamp Act, Townshend duties, the Boston Massacre and Tea Party, and the Coercive Acts; Lexington and Concord, Bunker Hill, and the Continental Congresses; Paine's Common Sense and the Declaration of Independence (July 4, 1776) — Jefferson's draft and the political philosophy of the Revolution: Locke's natural rights and the right of revolution, republicanism and civic virtue, the historians' argument between liberal and republican readings (Bailyn, Wood, Pocock), and the Declaration's contradictions on slavery; the war itself — Washington's army, Saratoga (1777) and the French alliance, Valley Forge, Yorktown (1781) and the Treaty of Paris (1783); how the Revolution affected people at all levels of society — the elite who occupied leadership roles, the regular citizens who mobilized for it, African Americans enslaved and free (Dunmore's Proclamation, Black Patriots and Black Loyalists), Loyalists and their exile, women (the homespun boycotts, Abigail Adams's 'Remember the Ladies'), Native nations, and immigrants; the Articles of Confederation, Shays's Rebellion, and the Constitutional Convention of 1787; and the Declaration's global afterlife as a template for later declarations of independence."
          },
          {
            "title": "The Enlightenment",
            "summary": "The eighteenth century's revolution in ideas: Locke and Newton as founding inspirations; the philosophes — Voltaire's campaigns against fanaticism, Montesquieu's separation of powers, Rousseau's social contract, Diderot and d'Alembert's Encyclopédie; Kant's 'What is Enlightenment?' (dare to know); the republic of letters — salons, coffeehouses, academies, and the women who ran the salons; the Scottish Enlightenment — Hume and Adam Smith; deism, toleration, and the critique of religious authority; enlightened absolutism (Frederick II, Catherine II, Joseph II); the movement's blind spots on slavery, race, and gender; its imprint on the American and French Revolutions; and the counter-Enlightenment critique from Burke to today."
          }
        ]
      },
      {
        "title": "Modern History",
        "children": [
          {
            "title": "industrialization"
          },
          {
            "title": "British Empire",
            "summary": "The empire on which the sun never set, c. 1600–1997: the first empire — Atlantic colonies, Caribbean sugar and slavery, Ireland — and its rupture with American independence (1783); the swing to the East — the East India Company, conquest of India, and the Raj after 1857; the settler dominions (Canada, Australia, New Zealand, South Africa) and responsible government; abolition (1807, 1833) alongside indentured labor; free-trade imperialism and the Victorian high noon — Victoria as Empress of India, the Scramble for Africa; the world wars as imperial wars and the empire's overstretch; Indian independence and Partition (1947); Suez (1956); African decolonization; Hong Kong's handover (1997); the Commonwealth; and the fierce ongoing debate over the empire's balance sheet."
          },
          {
            "title": "Imperial Expansion and Resistance",
            "summary": "The New Imperialism and the peoples who fought it, c. 1850–1914: the Scramble for Africa and the Berlin Conference (1884–85); the British Raj after the Indian Rebellion of 1857; the technologies of conquest — steamships, quinine, the Maxim gun — and the ideologies ('civilizing mission', social Darwinism); King Leopold's Congo; resistance and its outcomes — Ethiopia's victory at Adwa (1896), the Zulu and Ashanti wars, the Boxer Uprising, the Herero and Nama genocide, Maji Maji; the economics of empire and its critics (Hobson, Lenin); and how colonial resistance seeded the anticolonial nationalisms that would drive decolonization."
          },
          {
            "title": "world wars",
            "children": [
              {
                "title": "The First World War (WW1)",
                "summary": "One of the largest and most devastating conflicts the world has ever seen — and one of the first waged across the entire earth, from Europe to Africa, China, and the Middle East: not only a European conflict but a truly global one. Origins — alliance blocs, militarism, imperial rivalry, nationalism, and Sarajevo; course — the Schlieffen Plan's failure and trench warfare, Verdun and the Somme, with the military and economic aspects of the war in its principal European and Middle Eastern theaters (Gallipoli, the Arab Revolt, Mesopotamia and the Ottoman fronts), plus the campaigns in Africa, the seizure of Qingdao in China, and the empires' soldiers and laborers from India, Africa, China, and the Pacific; total war economies, blockade, and propaganda; American entry and Russia's revolutionary exit; legacies — the armistice, Versailles, and four collapsed empires; and how the war transformed conceptions of democracy, the state, gender, race, and art around the world — mass suffrage and welfare states, women's war work and the vote, colonial veterans and rising anticolonialism, Wilson's moment in Egypt, India, China, and Korea (1919), and the shattered aesthetics of Dada, the war poets, and modernism. Some 20 million died; the settlement set up the next war."
              },
              {
                "title": "The Second World War (WW2)",
                "summary": "The deadliest conflict in history (1939–1945): its origins in Versailles grievances, the Great Depression, fascism and Nazi ideology, appeasement (Munich 1938) and the Molotov-Ribbentrop pact; the invasion of Poland, Blitzkrieg, the fall of France, and the Battle of Britain; Operation Barbarossa and the Eastern Front; Pearl Harbor and the Pacific war; the Holocaust — the systematic murder of six million Jews; the turning points at Stalingrad, Midway, and El Alamein; D-Day and the liberation of Europe; island-hopping, the atomic bombings of Hiroshima and Nagasaki, and Japan's surrender; Yalta and Potsdam; 70–85 million dead, the founding of the United Nations, and the postwar order that led into the Cold War."
              }
            ]
          },
          {
            "title": "Hitler and the Death of Democracy in Germany, 1918-1945",
            "summary": "How a democracy died: Weimar's birth in defeat and revolution (1918–19) and its structural fragilities — Versailles's shadow, Article 48, fractured parties; the crises of 1923 (hyperinflation, the Beer Hall Putsch) and 1929; Hitler's road to power — Mein Kampf, the Nazi electoral surge of 1930–32, and the backroom deal of 30 January 1933; the Machtergreifung — the Reichstag fire, the Enabling Act, Gleichschaltung, the Night of the Long Knives; the Third Reich's mix of terror and consent — the Nuremberg Laws, propaganda, rearmament; the road to war and genocide; and 1945's reckoning — with Weimar's lessons for democratic fragility ever since."
          },
          {
            "title": "France Under Nazi Occupation",
            "summary": "The dark years, 1940–1944: the collapse of 1940 and the armistice; Vichy — Pétain's National Revolution, Laval, and collaboration d'État; the Statut des Juifs and the Vél d'Hiv roundup (1942), French complicity in deportation; the Milice; daily life — rationing, the démarcation line, the STO labor draft; resistance — de Gaulle's appeal of 18 June, Jean Moulin and unification, the maquis; liberation and the épuration; and the memory wars — the resistance myth, Paxton's revolution in the historiography, and the trials of Barbie, Touvier, and Papon."
          },
          {
            "title": "The Yalta Conference",
            "summary": "The February 1945 summit that sketched the postwar world: Roosevelt, Churchill, and Stalin at the Livadia Palace in Crimea; the agreements — the division of Germany into occupation zones and reparations, the Declaration on Liberated Europe and the promise of free elections in Poland, Soviet entry into the war against Japan in exchange for concessions in Asia, and the deal that made the United Nations possible (Security Council veto, founding conference at San Francisco); the context — the Red Army already held Eastern Europe, and FDR's failing health; what followed — the broken promises in Poland, Potsdam, and the descent into Cold War; and the long argument over whether Yalta was realistic statecraft or a 'betrayal' that conceded half of Europe."
          },
          {
            "title": "The Holocaust",
            "summary": "The Nazi genocide of Europe's Jews: the ideological roots of Nazi antisemitism; the Nuremberg Laws (1935) and Kristallnacht (1938); ghettoization; the Einsatzgruppen killings in the occupied East; the Wannsee Conference (1942) and the machinery of the 'Final Solution'; Auschwitz-Birkenau, Treblinka, and the death camps; six million Jewish victims, alongside Roma, disabled people, Soviet POWs, and others; Jewish resistance — the Warsaw Ghetto Uprising (1943) — and the rescuers; liberation, the Nuremberg trials, and Raphael Lemkin's word 'genocide'; and the politics of memory, testimony, and denial since."
          },
          {
            "title": "Global Cold War and the Arms Race",
            "summary": "The US-Soviet confrontation that organized the world, 1945–1991: from Yalta to the Iron Curtain; containment (Kennan), the Truman Doctrine, and the Marshall Plan; the Berlin blockade and the Wall; NATO and the Warsaw Pact; the nuclear arms race — from the Manhattan Project and Hiroshima to the H-bomb, ICBMs, Sputnik, and mutual assured destruction — and its treaties (the Test Ban, SALT and ABM, INF, START) alongside proliferation; the Cuban Missile Crisis (1962); the hot wars in Korea and Vietnam; the Cold War in the Global South — Westad's 'global Cold War' of interventions in Angola, Afghanistan, and Latin America; the Sino-Soviet split and Nixon in China; détente and its collapse; Reagan, Gorbachev, the revolutions of 1989, and the Soviet dissolution."
          },
          {
            "title": "Collapse of the Soviet Union and Eastern Europe: the End of the Cold War",
            "summary": "How the communist world came apart, 1985–1991: Gorbachev's glasnost and perestroika and the renunciation of the Brezhnev Doctrine; Poland — Solidarity, the Round Table, and the June 1989 elections; Hungary opens the border; the fall of the Berlin Wall (9 November 1989); Czechoslovakia's Velvet Revolution and the violent end of Ceaușescu's Romania; German reunification (1990); the Baltic drive for independence; the August 1991 coup, Yeltsin, and the dissolution of the USSR that December; shock therapy and the post-communist transitions; NATO and EU enlargement; and Yugoslavia's violent breakup as the era's dark counterpoint."
          },
          {
            "title": "The Soviet Union: History of the Soviet Empire",
            "summary": "The USSR from revolution to collapse (1917–1991): the February and October Revolutions, Lenin and the Bolsheviks, civil war and War Communism, the NEP; Stalin's rule — collectivization and the famines (including the Holodomor), the Five-Year Plans, the Great Terror, and the Gulag; the Great Patriotic War (Stalingrad, the Eastern Front's role in defeating Nazi Germany); superpower status in the Cold War — the nuclear arms race, Sputnik and the space race, the Warsaw Pact; Khrushchev's de-Stalinization and thaw, the Brezhnev era of stagnation, and dissidents like Solzhenitsyn and Sakharov; Gorbachev's glasnost and perestroika, the revolutions of 1989, and the dissolution of the USSR in 1991 — plus its contested legacy in Russia and the post-Soviet states."
          },
          {
            "title": "European decolonization",
            "summary": "The end of the European empires after 1945: India and Pakistan's independence and Partition (1947); Indonesia; Indochina and Dien Bien Phu (1954); the Suez crisis (1956) as the end of imperial pretension; Ghana (1957) and the African wave of 1960; the Algerian War (1954–62); the Congo crisis and Lumumba; the late Portuguese decolonizations (1974–75); Bandung (1955), non-alignment, and Third World solidarity; the theorists — Fanon, Nkrumah's neocolonialism; and the contested legacies: borders, the Commonwealth, Françafrique, and the debates over empire's balance sheet."
          },
          {
            "title": "The Vietnam War: the American War in Vietnam",
            "summary": "Three decades of war in Vietnam and its American convulsion: French Indochina and the First Indochina War — Dien Bien Phu (1954), the Geneva Accords, and partition; Diem's South and the National Liberation Front; the Gulf of Tonkin Resolution (1964) and Americanization — Rolling Thunder, search-and-destroy, the draft; the Tet Offensive (1968) as military defeat and political earthquake; My Lai; the antiwar movement, the media, and the credibility gap; Nixon's Vietnamization, the secret wars in Cambodia and Laos, and the Pentagon Papers; the Paris Accords (1973) and the fall of Saigon (1975); the costs — some 58,000 Americans and up to three million Vietnamese dead, plus the boat people; and the long aftermath in both countries, from the 'Vietnam syndrome' to the Memorial wall."
          },
          {
            "title": "Power and Protest in the Long 1960s: the May 1968 Movement",
            "summary": "Power and protest in the long 1960s — the year the postwar order shook: France in May–June 1968 — the student revolt from Nanterre to the Sorbonne, the barricades of the Latin Quarter, the general strike of some ten million workers, de Gaulle's vanishing act and return, the Grenelle accords, and the June elections; and the global 1968 around it — the Prague Spring and its crushing, Mexico's Tlatelolco massacre, the American upheavals (Tet, King's assassination, Columbia, the Chicago DNC), the West German and Italian movements; plus the long cultural afterlife: the New Left, second-wave feminism, environmentalism, and the endless argument over what 1968 changed."
          },
          {
            "title": "Partition and its Consequences: Ireland, India, Palestine",
            "summary": "Partition as the British Empire's exit strategy, three times over: Ireland (1920–22) — the border, civil war, and the long road to the Troubles and the Good Friday Agreement; India (1947) — Mountbatten's timetable, the Radcliffe line, up to fifteen million displaced and perhaps a million dead in Punjab and Bengal, and Kashmir's unresolved fate; Palestine (1947–48) — the UN partition plan, the war, and the Nakba; the comparative questions — minorities and borders drawn in haste, population transfer as 'solution', violence at the moment of imperial withdrawal; and why all three partitions remain politically alive today."
          },
          {
            "title": "The Neoliberal Age",
            "summary": "The market revolution of our times: the 1970s crisis of the postwar Keynesian order — stagflation, the oil shocks, the end of Bretton Woods; the intellectual insurgency from Mont Pèlerin to Hayek and Friedman; the Volcker shock; Thatcher and Reagan — privatization, deregulation, tax cuts, and the defeats of the miners and PATCO; the Washington Consensus and structural adjustment in the Global South; the third way of Clinton and Blair; financialization and rising inequality; the 2008 crisis and the age's contested afterlife — populist backlash, industrial policy's return, and the debate (Gerstle) over whether the neoliberal order has ended."
          },
          {
            "title": "The Coming of the Civil War",
            "summary": "How slavery broke the American union, 1820–1861: the Missouri Compromise; nullification; the Mexican War and the Wilmot Proviso; the Compromise of 1850 and the Fugitive Slave Act; Uncle Tom's Cabin and Northern opinion; the Kansas-Nebraska Act (1854), Bleeding Kansas, and the birth of the Republican Party; the caning of Sumner; Dred Scott (1857); the Lincoln-Douglas debates; John Brown's raid on Harpers Ferry (1859); Lincoln's election (1860); secession, the Confederacy, and Fort Sumter."
          },
          {
            "title": "The American Civil War",
            "summary": "The war that remade the United States (1861–1865): Union and Confederate resources, strategies, and leadership (Lincoln, Davis, Grant, Lee); Antietam and the Emancipation Proclamation; Gettysburg and Vicksburg (1863) as the turning point; Black soldiers and the USCT; total war and Sherman's March; the home fronts, conscription, and dissent; Appomattox and Lincoln's assassination; some 750,000 dead; the 13th–15th Amendments and the stakes of Reconstruction; and the memory wars — emancipationist memory versus the 'Lost Cause'."
          },
          {
            "title": "Modern China",
            "summary": "China from the Opium Wars to superpower: Qing decline — the Opium Wars, the Taiping Rebellion, self-strengthening, and the Boxer Uprising; the 1911 Revolution and Sun Yat-sen; warlords, the May Fourth Movement, and the Nationalist-Communist struggle; the Japanese invasion and the Second Sino-Japanese War; 1949 and the People's Republic; Mao's rule — the Great Leap Forward famine and the Cultural Revolution; Deng Xiaoping's reform and opening (1978); Tiananmen (1989); WTO accession (2001) and the rise to the world's second economy; and the Xi Jinping era."
          },
          {
            "title": "Maoism",
            "summary": "Mao's remaking of Marxism and its world career: the sinification of Marxism — peasant revolution, the Yan'an way, the mass line, and continuous revolution; Maoism in power — collectivization, the Great Leap Forward and its famine, the Cultural Revolution; the cult — the Little Red Book, the badge and the poster; global Maoism (Lovell) — India's Naxalites, Peru's Shining Path, Nepal's Maoists, the Khmer Rouge's dark variant, and the Western intellectuals of the 1960s-70s; and the afterlife — Maoism's ambiguous place in Deng's and Xi's China."
          },
          {
            "title": "The Cultural Revolution",
            "summary": "China's decade of upheaval (1966–1976): Mao's motives after the Great Leap disaster; the Red Guards, big-character posters, and struggle sessions; smashing the 'Four Olds' and the assault on teachers, intellectuals, and heritage; the fall of Liu Shaoqi and Deng Xiaoping; violence, factional civil war, and the army's restoration of order; the sent-down youth; the Lin Biao affair (1971); the Gang of Four and the end in 1976; the human toll and the 1981 party resolution — and how memory of the decade is managed and suppressed in China today."
          },
          {
            "title": "China Today: the Economic Miracle and Infrastructural Revolution",
            "summary": "The Chinese economic miracle of the past 40 years and its monumental infrastructural revolution: Deng's reform and opening (1978), the Special Economic Zones — Shenzhen from fishing village to megacity — WTO accession, and the largest poverty reduction in history; the country's modern and extensive infrastructure — the world's largest dams (Three Gorges and its 1.3 million displaced), the South-North Water Transfer, the world's largest high-speed railway network built almost from scratch after 2008, expressways, the great ports, and gleaming new cities housing hundreds of millions of new urbanites (and the 'ghost city' debate); how it was built — state capacity, five-year plans, state-owned enterprises, and land-finance; the Belt and Road as the model exported; the costs — environmental damage, debt, displacement; and the open question of whether the miracle can continue amid demographic decline, the property crisis, and rivalry with the United States."
          }
        ]
      },
      {
        "title": "Regional Histories",
        "children": [
          {
            "title": "Europe",
            "children": [
              {
                "title": "East European Identities: Russia and Ukraine",
                "summary": "Two nations and a contested inheritance: Kyivan Rus and the rival claims to its legacy; Cossack Ukraine and the Hetmanate; imperial Russification and the Ukrainian national revival of the nineteenth century; revolution and short-lived independence (1917–21); Soviet Ukrainization reversed by the Holodomor (1932–33); the bloodlands of the Second World War (Snyder); 1991 and the divergent post-Soviet paths; the Orange Revolution and the Maidan (2014); Crimea and the Donbas; the full-scale invasion of 2022; and the war over history itself — Putin's 'historical unity' essay versus Plokhy and the Ukrainian historians."
              },
              {
                "title": "The European Union",
                "summary": "The improbable union: from the Schuman Declaration and the Coal and Steel Community (1951) through the Treaty of Rome (1957), the single market, and Maastricht (1992); the euro and its flawed architecture; the great eastward enlargement of 2004; how the institutions work — Commission, Council, Parliament, Court — and the democratic-deficit debate; the crisis decade — the eurozone and Greece, the 2015 migration crisis, Brexit; the EU as peace project versus neoliberal machine; and today's questions — enlargement to Ukraine, strategic autonomy, and the union's place between the US and China."
              },
              {
                "title": "God Save the Queen: the British Monarchy",
                "summary": "How the British monarchy survived the age of revolutions and everything since: the constitutional bargain of 1688 and Bagehot's 'dignified' crown; Victoria and the imperial monarchy — Empress of India, the invention of royal tradition; the world wars and the Windsors' rebranding; the abdication crisis (1936); Elizabeth II's seven decades — the Commonwealth, decolonization's managed retreat, Diana and the near-death of deference, devolution and republicanism (Australia's 1999 referendum); Charles III; and the anthem's double life — from national hymn to the Sex Pistols' 1977 detonation of it."
              }
            ]
          },
          {
            "title": "Asia",
            "children": [
              {
                "title": "Chinese History",
                "summary": "Four thousand years of Chinese history before the modern rupture: Shang oracle bones and the origins of the writing system; the Zhou and the Mandate of Heaven; the hundred schools — Confucius, Laozi, the Legalists; Qin unification and the First Emperor (the terracotta army, the Great Wall's beginnings); the Han synthesis and the Silk Road; the Tang's cosmopolitan golden age; the Song commercial and technological revolution — paper money, printing, gunpowder, the compass; the Mongol Yuan and Marco Polo's China; the Ming — Zheng He's voyages and the turn inward; the Qing at its height under Kangxi and Qianlong; the machinery of empire — the examination system, the scholar-official, the dynastic cycle; and how this deep past frames China's modern transformation (continued in Modern China)."
              },
              {
                "title": "Han History",
                "summary": "China's formative empire (206 BCE–220 CE): from Qin's collapse to Liu Bang's founding; Emperor Wu's expansion and the opening of the Silk Road (Zhang Qian's missions); the Confucian state — the imperial academy and the beginnings of the examination ideal; Sima Qian's Records of the Grand Historian, the model for all Chinese history-writing; paper's invention; Wang Mang's interregnum and the Eastern Han restoration; court politics — empresses, eunuchs, and the great families; the Yellow Turban revolt and the empire's dissolution into the Three Kingdoms; and why 'Han' became the name of the Chinese people themselves."
              },
              {
                "title": "Ming-Qing History",
                "summary": "China's last two dynasties (1368–1912): the Ming founding after the Mongols — the Hongwu autocracy, the Yongle emperor, Zheng He's ocean voyages and the turn inward, the Great Wall rebuilt; late-Ming commercial efflorescence — silver from the Americas, print culture, the Jiangnan cities; the Manchu conquest of 1644 and the Qing synthesis — banners, the queue, and rule over a multiethnic empire (Tibet, Xinjiang, Mongolia); the High Qing under Kangxi, Yongzheng, and Qianlong; the Jesuits at court; population explosion and its strains; the White Lotus rebellion and dynastic overstretch — setting the stage for the nineteenth century's crises (continued in Modern China)."
              },
              {
                "title": "Premodern Korean History",
                "summary": "Korea before the modern rupture: Gojoseon and the peninsula's early states; the Three Kingdoms — Goguryeo, Baekje, Silla — and Silla's unification with Tang help (668); Goryeo — the celadon age, the Tripitaka Koreana carved against the Mongols, and the world's first metal movable type; the Joseon dynasty (1392–1897) — Neo-Confucian state-building, King Sejong and the invention of hangul (1443), the yangban aristocracy; the Imjin War — Hideyoshi's invasions and Admiral Yi Sun-sin's turtle ships (1592–98); the Manchu invasions and tributary ties to Qing China; the 'hermit kingdom' and its opening in 1876 — with the deep patterns that still shape both Koreas."
              },
              {
                "title": "Modern South Asia",
                "summary": "The subcontinent from the Mughals' decline to today: East India Company rule and the 1857 Rebellion; the Raj — railways, famines, and the drain debate; the nationalist movement — Congress, Gandhi's satyagraha, Jinnah and the Muslim League; Partition (1947) and its wounds; Nehru's India and Pakistan's turbulent path; the 1971 war and Bangladesh's birth; Sri Lanka's civil war; the Emergency; liberalization (1991) and India's rise; Kashmir, nuclear rivalry, and Hindutva politics — with the diaspora carrying South Asia worldwide."
              },
              {
                "title": "Modern Southeast Asia",
                "summary": "From colonial patchwork to ASEAN century: the colonial regimes — Dutch East Indies, British Malaya and Burma, French Indochina, the American Philippines, and Siam's exceptional independence; the Japanese occupation as rupture; the independence struggles and revolutions; the Cold War battleground — Vietnam, the Indonesian massacres of 1965–66, ASEAN's founding (1967); the tiger economies and the 1997 Asian financial crisis; Suharto, Marcos, and People Power; and the contemporary region — Singapore's model, Myanmar's coups, and Southeast Asia between China and the United States."
              },
              {
                "title": "The Modern History of Rural China",
                "summary": "The Chinese revolution and reform as the countryside lived them: the rural crisis of the republican era and why the CCP won the villages; land reform and the destruction of the landlord class; collectivization, the people's communes, and the Great Leap famine's rural devastation; the hukou system and the rural-urban divide it entrenched; the household responsibility system and the reform era's village boom (township and village enterprises); the great migration — 300 million migrant workers and the left-behind villages; rural taxation revolts, land grabs, and protest; and the poverty-alleviation and rural-revitalization campaigns of the Xi era."
              },
              {
                "title": "Indochina and Modern Vietnam, 1880s-1980s",
                "summary": "A century of colonialism and war in Indochina: French rule — rubber and rice, the mission civilisatrice and its contradictions; anticolonial currents and Ho Chi Minh's road to the Indochinese Communist Party; the Second World War, the Japanese coup, and the famine of 1945; the August Revolution and the First Indochina War — Dien Bien Phu (1954) and Geneva's partition; the American war (cross-referenced with The Vietnam War); Cambodia's descent — the Khmer Rouge genocide (1975–79); the Vietnamese invasion of Cambodia and the Sino-Vietnamese war (1979); the boat people; and đổi mới (1986) — modern Vietnam's turn."
              }
            ]
          },
          {
            "title": "Africa",
            "children": [
              {
                "title": "History of Sub-Saharan Africa to 1860: Precolonial States and Societies",
                "summary": "The histories of precolonial states, and Africa on its own terms before the colonial partition, recovered through its rich oral histories — the griots, the Sundiata epic of Mali, and Vansina's method of reading oral tradition as history — alongside archaeology and written sources: the Bantu migrations; Aksum and early Christian Ethiopia; the Sahelian empires — Ghana, Mali (Mansa Musa, Timbuktu), and Songhai — and the trans-Saharan trade; the Islamic intellectual tradition that flourished in West Africa from the sixteenth century — the Timbuktu manuscript libraries, Sankoré scholarship, Ahmad Baba, and ajami writing; the Swahili coast and the Indian Ocean world; Great Zimbabwe; Kongo, Benin, and the forest kingdoms; the spread of Islam and Christianity; slavery and the slave trades in and from Africa — domestic slavery, the trans-Saharan and Indian Ocean trades, and the Atlantic trade's demographic and political impact; the nineteenth-century transformations — the Sokoto Caliphate of Usman dan Fodio and the scholar-poet Nana Asma'u, the Zulu kingdom and the mfecane, Omani Zanzibar; and the continent on the eve of European conquest."
              },
              {
                "title": "Modern African History since 1860",
                "summary": "The continent from partition to the present: the Scramble for Africa and the Berlin Conference (1884–85); colonial rule and its varieties — direct and indirect rule, settler colonies, Leopold's Congo; the impact of colonialism in Africa — economic extraction and cash-crop economies, arbitrary borders, missionary education, invented ethnic divisions, and the legacies anatomized by Fanon and Rodney's How Europe Underdeveloped Africa; resistance from Adwa (1896) to Maji Maji to Mau Mau; Africans in the world wars; the decolonization wave — Ghana (1957), the year of Africa (1960), the Algerian War, the Portuguese wars to 1975; the Congo crisis and Lumumba; apartheid South Africa and the liberation struggle — Sharpeville, Soweto, and Mandela's 1994 election; post-independence trajectories — nation-building, one-party states and coups, the Cold War's proxy wars in Angola and the Horn, structural adjustment; the Rwandan genocide (1994); and the twenty-first century — the African Union, demographic boom, mobile-money innovation, and Africa's contested place in a multipolar world."
              },
              {
                "title": "Health and Healing in African History",
                "summary": "Sickness, healing, and the mind in African history: African therapeutic systems — healers and herbalists, divination, spirit possession and ngoma, and their ongoing pluralism alongside biomedicine; witchcraft, causation, and mental health — Evans-Pritchard's Azande and witchcraft as an explanation of misfortune, accusations and their modern resurgence; colonial medicine and psychiatry — the racialized invention of the 'African mind', asylums, and Fanon's critique; substance abuse — khat, cannabis, and alcohol under colonial regulation and after; violence and mental illness — war trauma, child soldiers, and the contested universality of PTSD; and the more recent links between HIV/AIDS, loss, and depression — from denialism to antiretrovirals, orphanhood, and grief — within today's global mental health debate over universal categories versus local idioms of distress."
              },
              {
                "title": "History of Sport in Africa",
                "summary": "Play, power, and the postcolony: indigenous sporting traditions — wrestling, stick-fighting, board games — and their meanings; colonial sport as discipline and 'civilizing' project, and how Africans made it their own; football's conquest of the continent — from mission schools to CAF and the Africa Cup of Nations; sport in the liberation struggle — the apartheid sports boycott and South Africa's isolation, the 1995 Rugby World Cup as reconciliation theater; the runners — Abebe Bikila barefoot in Rome (1960), Kip Keino, and East Africa's distance dynasty; the 2010 South African World Cup; and the political economy of the player migration to European leagues."
              },
              {
                "title": "Women in African History",
                "summary": "African history with women at the center: queens and queen mothers — Amanirenas of Kush who fought Rome, Njinga of Ndongo and Matamba, the Asante queen mothers and Yaa Asantewaa's war (1900); women's economic power — the market women of West Africa; women in and against the slave trades; spiritual authority — priestesses, prophets (Kimpa Vita), and spirit mediums (Nehanda); how colonialism eroded women's institutions — and the resistance it provoked, from the Igbo Women's War (1929) to anticolonial heroines; nationalist and post-independence leaders — Funmilayo Ransome-Kuti, Ellen Johnson Sirleaf, Wangari Maathai; and the historiographical recovery of women's voices from sources that tried to erase them."
              }
            ]
          },
          {
            "title": "Americas",
            "children": [
              {
                "title": "Native American and Indigenous Studies",
                "summary": "Indigenous histories of the Americas and the field that studies them: the deep past — Cahokia, the Mesoamerican and Andean civilizations, and the diverse nations of North America; contact, the demographic catastrophe, and the Columbian exchange; settler colonialism as a structure, not an event (Patrick Wolfe); treaties and dispossession — removal and the Trail of Tears, the Plains wars, allotment (Dawes Act), the boarding schools; twentieth-century policy from termination and relocation to self-determination; Red Power — Alcatraz, AIM, and Wounded Knee (1973); sovereignty and treaty rights today — NAGPRA, ICWA, Standing Rock; the global Indigenous movement and UNDRIP (2007); and the field's methods — oral tradition as evidence, decolonizing methodologies (Linda Tuhiwai Smith), and Indigenous scholars remaking how this history is told."
              },
              {
                "title": "Afro-Indigenous Intersections in Early America",
                "summary": "Where African and Native American histories met: Native slavery and the Carolina Indian slave trade alongside African slavery; Africans and Indigenous people intermarrying, allying, and building kin in colonial borderlands; maroon communities and the Black Seminoles; freedom suits that turned on Indigenous ancestry; how settler racial regimes divided the two — blood quantum for Native peoples, the one-drop rule for Black people — and the consequences; slavery within the Five Tribes and the Black freedmen's citizenship struggles that continue today; and the scholars recovering these entangled histories (Tiya Miles, Kyle Mays)."
              },
              {
                "title": "Moctezuma's Mexico",
                "summary": "The Aztec world at its height and its catastrophic encounter: Tenochtitlan — the lake city of canals and chinampas that stunned the conquistadors; the Triple Alliance's tribute empire; Mexica religion, the temple precinct, and the meanings of sacrifice; merchants, markets (Tlatelolco), and everyday life; Moctezuma II — the ruler and the myths later wrapped around him; the conquest — Cortés, La Malinche, the Tlaxcalan alliance, the Noche Triste, smallpox, and the siege of 1521; how we know — the Florentine Codex and Nahua voices alongside Spanish chronicles (León-Portilla's Broken Spears); and the Aztec afterlife in colonial and modern Mexican identity."
              },
              {
                "title": "Indigenous Economies and Environments",
                "summary": "How Indigenous peoples of the Americas shaped and sustained their worlds: land management as science — fire regimes that made the prairies and California's abundance, clam gardens and salmon stewardship on the Northwest Coast, the buffalo economy of the Plains; agriculture — maize's domestication, the milpa and Three Sisters, Cahokia's fields and the Amazon's terra preta; exchange — continent-spanning trade in obsidian, dentalium, and copper, gift economies and the potlatch; the myth of untouched 'wilderness' (Cronon, Denevan's 'pristine myth'); dispossession's ecological consequences; and the present — traditional ecological knowledge, co-management, and Indigenous-led conservation."
              },
              {
                "title": "Indigenous Oral Literatures of the Northwest Coast of North America",
                "summary": "The great oral literatures of the Haida, Tlingit, Tsimshian, Kwakwaka'wakw, Nuu-chah-nulth, and Coast Salish peoples: the Raven cycle and the trickster's world-making; crest histories, clan prerogatives, and the oratory of the potlatch; stories as law and title — oral histories admitted as evidence in Delgamuukw v. British Columbia (1997); the tellers and the collectors — Boas and George Hunt's archive and its colonial entanglements; ethnopoetics (Hymes, Tedlock) and the argument over how to write oral performance; Bringhurst's Haida translations and the controversy they sparked; Harry Robinson's told-to narratives; and the living tradition — language revitalization and contemporary Indigenous storytellers carrying the canon forward."
              }
            ]
          },
          {
            "title": "Middle East",
            "children": [
              {
                "title": "The Making of the Modern Middle East",
                "summary": "How the region's modern map and politics were made: late Ottoman reform and collapse; the First World War's triple promises — Sykes-Picot, the Balfour Declaration, the McMahon correspondence; the mandates and state-building in Iraq, Syria, Lebanon, Transjordan, and Palestine; oil and the making of the Gulf; Israel's founding and the Nakba (1948); Nasser, pan-Arabism, and Suez (1956); the wars of 1967 and 1973; Iran's 1979 revolution; Lebanon's civil war; the Gulf wars, Oslo and its collapse, the Arab Spring and its aftermath — and the patterns connecting a century of intervention, authoritarianism, and resistance."
              },
              {
                "title": "A History of Modern Syria",
                "summary": "Syria from Ottoman province to shattered and remade state: greater Syria under the Ottomans; the French mandate — partition into statelets and the Great Revolt of 1925; independence (1946) and the coup-ridden decades; the Ba'th, the union with Egypt, and 1963; Hafez al-Assad's Syria — the security state, the Muslim Brotherhood uprising and Hama (1982); Bashar and the false spring; 2011 — the uprising and its descent into civil war; the actors — the regime and its Russian and Iranian patrons, the opposition, ISIS and the caliphate, the Kurds; barrel bombs, chemical attacks, and half the population displaced; the fall of the Assad regime in December 2024 and the uncertain transition since — with a century's lessons about minority rule, sectarianism, and outside powers."
              },
              {
                "title": "Jerusalem, a History: From Antiquity to the Present",
                "summary": "One city, three faiths, four thousand years: Bronze Age origins and the city David took; Solomon's Temple, the Babylonian destruction (586 BCE) and exile; the Second Temple, Herod's rebuilding, and Rome's destruction of it (70 CE); Aelia Capitolina; Byzantine Christian Jerusalem and the Holy Sepulchre; the Islamic conquest, the Dome of the Rock and al-Aqsa; the Crusader kingdom and Saladin's reconquest; Mamluk and Ottoman centuries (Suleiman's walls); British Mandate Jerusalem; 1948 and the divided city; 1967 and the contested unification; and the present — holy sites, sovereignty claims, and why Jerusalem remains the hardest question of the Israeli-Palestinian conflict (Montefiore's biography of the city as anchor text)."
              }
            ]
          },
          {
            "title": "The 'Settler Revolution' at the Edge of Empire: Australia, 1770-1901",
            "summary": "Australia from Cook to Federation: James Cook's 1770 charting and claim of the east coast; the doctrine of terra nullius; the First Fleet and the penal colony at Sydney Cove (1788) and the convict transportation system; frontier violence and the dispossession of Aboriginal peoples — epidemics, massacres, and resistance leaders like Pemulwuy; squatters, pastoral expansion, and the wool economy; the 'settler revolution' (James Belich's term) of explosive Anglo migration and boom-bust growth; the 1850s gold rushes and the Eureka Stockade (1854); colonial self-government; anti-Chinese agitation and the roots of White Australia; and the federation movement culminating in the Commonwealth of Australia on 1 January 1901 — with the century's enduring consequences for Indigenous Australians."
          }
        ]
      },
      {
        "title": "Thematic History",
        "children": [
          {
            "title": "economic"
          },
          {
            "title": "social history",
            "summary": "History from below: how ordinary people — workers, peasants, women, servants, migrants, the poor — lived, worked, married, ate, and died; the field's revolutions — the Annales school and the longue durée, E. P. Thompson's The Making of the English Working Class and agency from below, microhistory (Ginzburg's The Cheese and the Worms); family and demography, childhood, food, housing, leisure, and everyday life; crime and punishment from below; the archives of the inarticulate — parish registers, court records, oral history; and how social history transformed what counts as historical evidence and whose lives count as history."
          },
          {
            "title": "military history",
            "summary": "War as a constant of the modern age — there was a war or other violent conflict somewhere in the world in every single year of the 19th and 20th centuries: the Napoleonic Wars and the Concert of Europe that failed to end war; the century of 'small wars' — colonial conquests, frontier violence, and imperial policing; Latin America's independence and interstate wars (including the Paraguayan War, proportionally the deadliest); the Taiping Rebellion, history's bloodiest civil war; Crimea, the wars of German and Italian unification, and the US Civil War as rehearsals of industrial war; the world wars and total war; and the post-1945 era's proxy wars, civil wars, and genocides that belie the 'long peace'. Alongside the fighting: military revolutions and technology, conscription and the nation in arms, logistics and economies, the laws of war from the Geneva Conventions onward, and how societies remember and forget their wars."
          },
          {
            "title": "intellectual history"
          },
          {
            "title": "History of Peace and Peacemaking",
            "summary": "How wars end and how peace is made and kept: the great peace negotiations after wars — Westphalia (1648), the Congress of Vienna (1814–15) and the balance of power, the Paris Peace Conference (1919) with Wilson's Fourteen Points and the League of Nations, San Francisco and the UN (1945), and later settlements from Camp David to Dayton and the Good Friday Agreement; and the people who have advocated for peace — not just pacifists but also scientists (the Russell-Einstein Manifesto, Pugwash, Linus Pauling), academics (Galtung's positive versus negative peace), lawyers (the Hague Conventions, René Cassin and the UDHR, Lemkin), religious leaders (the Quakers, Desmond Tutu, the Dalai Lama), politicians (Wilson, Willy Brandt's Ostpolitik), freedom fighters and civil rights activists (Gandhi's satyagraha, Martin Luther King Jr., Mandela); the women's peace movement (Jane Addams, WILPF) and nuclear disarmament campaigns (CND, the freeze); truth and reconciliation commissions; and peace understood not merely as the absence of war but as social justice and respect for human dignity."
          },
          {
            "title": "American Capitalism",
            "summary": "The economic history of the United States as the history of its capitalism: colonial merchants and Hamilton's financial program; the market revolution — canals, railroads, the telegraph; slavery's cotton economy and the 'new history of capitalism' debate; the corporation and the Gilded Age titans (Rockefeller, Carnegie, J.P. Morgan) and the antitrust response; Fordism and mass consumption; the Crash of 1929 and the New Deal's remaking of the state-market bargain; the postwar boom and the consumer republic; deregulation and financialization from the 1970s; and Silicon Valley, venture capital, and the platform economy."
          },
          {
            "title": "U.S. Foreign Policy",
            "summary": "America's role in the world from Washington to the present: the Farewell Address and the isolationist inheritance; the Monroe Doctrine (1823); continental expansion and the Mexican War; 1898 and the debate over empire; Wilson, the First World War, and the League fight; from neutrality to the Second World War and the architecture of the liberal order (UN, Bretton Woods, NATO); containment and its wars — Korea and Vietnam; Nixon-Kissinger realpolitik and the opening to China; Reagan and the Cold War's end; unipolarity, humanitarian intervention, 9/11 and the wars in Afghanistan and Iraq; and the turn to great-power competition with China."
          },
          {
            "title": "Urban History",
            "summary": "The city as history's great artifact: from Uruk and the first urban revolution through the classical, Islamic, and medieval city; the industrial city's shock — Manchester, Engels, cholera, and the sanitary reform it forced; planning and its hubris — Haussmann's Paris, the garden city, Le Corbusier's modernism, and Jane Jacobs versus Robert Moses; segregation built into space — redlining, ghettos, apartheid urbanism; suburbanization and sprawl; the Global South's urban century — megacities and informality (Davis's Planet of Slums); and the questions of the urban age — housing, gentrification, and the climate-adapted city."
          },
          {
            "title": "Global History",
            "summary": "History beyond the nation-state — the field and its methods: connections and comparisons across regions; world-systems theory (Wallerstein) and the Great Divergence debate (Pomeranz); commodities as global threads — Mintz's sugar, Beckert's cotton; oceans as units of analysis — Atlantic, Indian Ocean, Pacific worlds; mobilities — migration, disease, ideas; global microhistory and the biographies that cross empires; the critiques — Eurocentrism smuggled back in, the 'global' that ignores the immobile (Adelman) — and what global history reveals that national histories cannot."
          },
          {
            "title": "Borders and Borderlands",
            "summary": "How humanity drew its lines: from frontiers and marches to the surveyed boundary — natural-border myths, the cartographic state; the great line-drawings — the Berlin Conference's Africa, Sykes-Picot, the Radcliffe line, the DMZ; passports and papers — the First World War watershed and the 'invention of the passport' (Torpey); borderlands as worlds of their own — mixing, smuggling, and shifting identity (Sahlins, the US-Mexico borderlands school); walls from Hadrian to Berlin to today's border fortifications; Schengen's opening against the global hardening; and the border as industry, spectacle, and humanitarian crisis."
          },
          {
            "title": "Cryo-History: Histories of Cold Places",
            "summary": "The past read from ice: polar exploration and its dramas — Franklin's lost expedition, Scott and Amundsen's race, Shackleton's Endurance; the Indigenous Arctic — Inuit, Sámi, and the knowledge that explorers borrowed and erased; ice cores as archives — how Greenland and Antarctic ice record volcanoes, lead pollution, and ten thousand years of climate; the cold rush — whaling, sealing, and fur; refrigeration's revolution in food and cities (the cold chain); cryosphere geopolitics — the Antarctic Treaty (1959), Arctic sea routes and resources; and the melt itself as the great historical event of our time — permafrost, glaciers, and what their retreat exposes and unleashes."
          },
          {
            "title": "Histories of Emotions: From the 'Rational Self' to Modern Neuroscience",
            "summary": "Do feelings have a history? From the 'rational self' of Enlightenment thought to modern neuroscience: Febvre's call to write the history of sensibility; honor and shame societies; the eighteenth century's cult of sensibility and public weeping; Victorian restraint and the stiff upper lip; fear, love, anger, and grief as they changed across time; the field's tools — Stearns's emotionology, Rosenwein's emotional communities, Reddy's emotives; emotional labor (Hochschild) and the management of feeling in modern capitalism; and the neuroscience turn — LeDoux, Damasio, and Barrett's constructed emotion — in dialogue with history's evidence that emotions are made, not merely given."
          },
          {
            "title": "History of Energy",
            "summary": "Civilization as an energy story (Smil): muscle, fire, and biomass; water and wind — the medieval power revolution of mills and sails; the coal transition and why it happened in Britain (Wrigley's organic-economy escape); steam, railways, and fossil industrialization; oil's twentieth century and electricity's transformation of everything; nuclear promise and fear — from Hiroshima to Chernobyl and Fukushima; energy and power in both senses — Mitchell's Carbon Democracy on coal strikes versus oil's politics; energy poverty and global inequality; and the renewable transition now underway — solar's plunge, grids and storage, and whether this transition can be faster than all the ones before."
          },
          {
            "title": "The Role of Infrastructure in History: its Powers and Limitations",
            "summary": "Infrastructure as the skeleton of power and everyday life: the ancient systems — Roman roads and aqueducts, the Persian Royal Road, qanats, and China's Grand Canal; the industrial age's networks — the Erie, Suez, and Panama canals, the transcontinental railroads, submarine telegraph cables; sanitation and the public-health revolution (London's sewers after the Great Stink), electrification, and the American interstate system. Its powers: state-building and 'infrastructural power' (Michael Mann), empire's 'tools' (Headrick), markets made and cities transformed. Its limitations and dark sides: who gets served and who gets bypassed — redlining, Robert Moses's parkways, splintered cities; legibility's failures (Scott's Seeing Like a State); cost overruns, white elephants, deferred maintenance and collapse, path dependence; and the present stakes — the green and digital transitions, China's buildout versus the West's gridlock, and infrastructure as geopolitics (Belt and Road)."
          },
          {
            "title": "Oil and Empire",
            "summary": "How the political economy of oil has shaped the rise and fall of empires, the fate of nation-states, the making of the economy, the nature of class, gender, and racial discrimination, and the production of historical knowledge and the built urban environment. Empires and states: Churchill's coal-to-oil navy and Anglo-Persian (1911–14), the post-WWI carve-up of Middle Eastern concessions (the Red Line Agreement, the Seven Sisters, Aramco), oil in the world wars, the Mossadegh coup (1953), OPEC and the 1973 shock, petrodollars, the Carter Doctrine and the Gulf Wars, and the 'resource curse.' The economy and its people: Rockefeller's Standard Oil and its breakup; oil labor and class struggle from Baku to the Mexican oil fields; gendered oil towns and petro-masculinity; racial hierarchies in the industry's segregated camps and company towns (Vitalis's America's Kingdom). Knowledge and the city: how company archives and court histories shaped what we know (Yergin's The Prize versus Mitchell's Carbon Democracy and the revisionists), and oil's built environment — Houston and the boomtowns, the automobile suburb, and the car-centric city — down to climate politics and the contested end of oil."
          },
          {
            "title": "AI and Empire",
            "summary": "The relationship between AI and empire, read historically: computing's imperial and military genealogy — Hollerith's census machines, Bletchley Park, and the Cold War funding (DARPA, SAGE) that built the field; earlier 'tools of empire' (Headrick's telegraphs and railways) as the precedent; the material empire of AI — chips and the Taiwan chokepoint, export controls, rare earths, energy-hungry data centers, undersea cables; data colonialism and extraction (Couldry and Mejias, Crawford's Atlas of AI) and the Global South labor of data labeling and content moderation; platform power and surveillance capitalism (Zuboff); AI nationalism and the US-China contest; algorithmic governance, facial recognition, and the export of surveillance; digital sovereignty movements and calls for decolonizing AI (Gebru and the AI-ethics dissidents); and whether AI concentrates power like the imperial technologies before it — or can be governed differently."
          },
          {
            "title": "American Empire: the Rise of the United States as a Global Empire",
            "summary": "How a settler republic became a global empire — and what that rise did to the planet: continental empire first (the Louisiana Purchase, Indian removal and the wars of dispossession, the Mexican cession); 1898 and the overseas turn — Cuba, Puerto Rico, the Philippines and its brutal war, Hawai'i and Guam; the Panama Canal, dollar diplomacy, and interventions in Latin America; the Second World War, the 'empire of bases,' Bretton Woods, and the Cold War national security state; the historians' debate — formal versus informal empire, Williams's 'empire as a way of life,' 'empire by invitation.' The same century saw profound transformations in natural ecologies worldwide — plantation economies (United Fruit), oil frontiers, the Green Revolution, nuclear testing in the Pacific, Agent Orange in Vietnam — and the answering rise of environmental movements, from conservation and Silent Spring to Earth Day, the EPA, environmental justice, and global environmentalism."
          },
          {
            "title": "Global History of Capitalism: Past, Present, Future",
            "summary": "Capitalism as a world system across five centuries: the transition to capitalism itself — enclosure, agrarian change, and the Brenner debate; merchant capitalism and the joint-stock revolution (the VOC, 1602); slavery and capitalism — the Atlantic economy's role in early accumulation, from the Williams thesis to the new history of capitalism; the Industrial Revolution and factory capitalism, with class formation and class conflict at its heart (Thompson's making of the working class, the strike waves and labor movements); industrialization and deindustrialization as one connected story — the factory's rise in the North Atlantic and its migration to the Global South, the rust belts left behind; the labor capitalism doesn't count — informal employment from street vendors to gig platforms, and unwaged reproductive labor (Federici and the wages-for-housework argument); the gold standard and the first globalization (1870–1914); collapse — world wars and the Great Depression; Bretton Woods (1944) and the embedded-liberal postwar boom; the 1970s crisis, the end of dollar-gold convertibility (1971), and the neoliberal turn (Thatcher, Reagan, the Washington Consensus); China's reform era (1978) and global supply chains; the 2008 financial crisis; platform and digital capitalism; inequality and its critics (Piketty); and the contested future — climate change and the green transition, deglobalization, automation and AI — read through Smith, Marx, Keynes, Hayek, and Polanyi."
          },
          {
            "title": "American Food",
            "summary": "The United States told through what it eats: Indigenous foodways and the Three Sisters; the Columbian exchange on the plate; enslaved cooks and the African roots of Southern and soul food; immigrant kitchens — how Italian, Chinese, Mexican, and Jewish food became 'American'; industrialization — canning, refrigeration, the meatpacking exposés (Sinclair's The Jungle) and the Pure Food and Drug Act (1906); the supermarket, the TV dinner, and the suburban kitchen; fast food's empire — McDonald's and the drive-thru nation; hunger and abundance — food stamps, food deserts, obesity; the counterculture's whole-earth cooking, Julia Child, and farm-to-table (Alice Waters); and food as identity, region, and argument — barbecue's borders and all."
          },
          {
            "title": "Scandals in History: Moral Panics, Repression, and Reform",
            "summary": "The big scandals in history and how they sparked state repression, political activism, and moral panics — and how, case by case, they drove social change and became a fundamental driver of governance. Organized by theme, showing how individual incidents emerged from and influenced their wider historical contexts, and how scandals illuminate the past: imposture and fraud (the Tichborne claimant); frontier violence (the Myall Creek massacre trials, 1838); urban youth and the larrikin panics; trial by media (the Lindy Chamberlain 'dingo' case); war crimes (Breaker Morant, 1902; Amritsar, 1919); status anxiety and spies (the Petrov affair, 1954). Anchored in the scandals of Australia and the British imperial world across the nineteenth and twentieth centuries — convict-system exposés, the Governor Eyre controversy after Morant Bay (1865), W. T. Stead's 'Maiden Tribute of Modern Babylon' (1885) and the age-of-consent panic, the Wilde trials, Emily Hobhouse and the Boer War camps, the Congo atrocities campaign (Morel, Casement), the Stolen Generations and institutional-abuse royal commissions — but going beyond: the Dreyfus Affair, Teapot Dome, Profumo, Watergate, Iran-Contra, and phone hacking. Each time, tracing the mechanics — investigative journalism, moral panic (Stanley Cohen), commissions of inquiry, and reform legislation — to show how these scandals affected the world."
          },
          {
            "title": "The Global History of Quantitative Data",
            "summary": "The global history of quantitative data and the ways numerical reasoning came to shape the nature of knowledge as we know it — from long division to population censuses, standardized testing to the personal computer: cuneiform accounting as writing's origin; Hindu-Arabic numerals, al-Khwarizmi, and the arithmetic that made calculation teachable; double-entry bookkeeping and merchant capitalism; political arithmetic (Graunt, Petty) and the modern census — from Rome and imperial China to the US census of 1790 and Hollerith's 1890 punch cards that birthed IBM; probability and statistics — Pascal, Quetelet's 'average man', Galton and regression (and the eugenics entanglement), Pearson, Fisher; Hacking's 'avalanche of numbers' and Porter's Trust in Numbers — quantification as objectivity and as politics; standardized testing from Binet and the Army Alpha to the SAT; GDP and national accounts; the computer — Babbage, ENIAC, the personal computer and the spreadsheet; and the present of databases, big data, and algorithmic decision-making, with its debates over surveillance and bias."
          },
          {
            "title": "Environmental history",
            "summary": "The story of human choices made within the constraints imposed by the non-human world: climate as an actor — the Little Ice Age, the seventeenth-century crisis, and today's anthropogenic climate change and the Anthropocene debate; extinctions — from the megafauna to the passenger pigeon and the ongoing sixth extinction; invasive species and biological exchange — the Columbian exchange and Crosby's ecological imperialism; energy as history's motor — the transitions from wood and muscle to coal, oil, and the atom, and what each rearranged; disease environments (McNeill); deforestation, soils, and the Dust Bowl (Worster); regulation and the state — conservation versus preservation (Pinchot, Muir), national parks, the EPA, the Clean Air and Water Acts, and the Montreal Protocol; environmentalism from Silent Spring (1962) to Earth Day; and the field's classics — Crosby, Worster, and Cronon's Changes in the Land and Nature's Metropolis."
          },
          {
            "title": "Digital History",
            "summary": "How computers and the internet changed the practice of history: the field's roots in humanities computing and pioneers like Roy Rosenzweig; mass digitization of archives, newspapers, and books; distant reading and text mining of large corpora; GIS and spatial history; network analysis of correspondence and trade; databases and quantitative history; crowdsourced transcription projects (e.g. Transcribe Bentham); public history on the web and digital exhibits; born-digital sources and web archives as the historical record of our own era; and the methodological debates — what counts as an argument, sustainability of projects, and the limits of quantification."
          },
          {
            "title": "Labor and the Political Economy in U.S. History",
            "summary": "The lives of workers — men and women, slave and free, union and non-union, agricultural, industrial, and service-sector — and how they were shaped by, and how they shaped, economic history: unfree and free labor systems (indentured servitude, slavery, wage labor); industrialization and the factory system; the great labor conflicts — the Railroad Strike of 1877, Haymarket (1886), Homestead (1892), Pullman (1894); the Knights of Labor, the AFL under Samuel Gompers, and the IWW; the Triangle Shirtwaist fire (1911) and Progressive Era reform; the New Deal order — the Wagner Act (1935), the CIO, the Fair Labor Standards Act (1938); Taft-Hartley (1947) and the postwar labor-capital accord; deindustrialization, the PATCO strike (1981), and declining union density; and the running debates over tariffs, antitrust and monopoly, laissez-faire versus regulation, and neoliberalism."
          },
          {
            "title": "slavery",
            "summary": "Slavery as a world-historical institution: bondage in the ancient world (Greece, Rome's slave society); slavery and the medieval worlds — trans-Saharan and Indian Ocean trades, the Islamic world, and the distinction from serfdom; the Atlantic system — the plantation complex, the Middle Passage, and the racialization of slavery; law and life under slavery — family, culture, religion, and everyday resistance; revolt and marronage; abolitionism and the emancipations from Britain (1833) to the US Civil War to Brazil (1888); the afterlives — sharecropping, Jim Crow, and reparations debates; and modern slavery and human trafficking today."
          },
          {
            "title": "Abolitionist Women",
            "summary": "The women who drove the fight against slavery on both sides of the Atlantic: Britain's pioneers — Elizabeth Heyrick's call for immediate emancipation and the women-led sugar boycotts; America's organizers and orators — the Grimké sisters, Lucretia Mott and the Philadelphia Female Anti-Slavery Society, Lydia Maria Child, and Maria Stewart; Black abolitionist women — Sojourner Truth ('Ain't I a Woman?'), Harriet Tubman and the Underground Railroad, Frances Ellen Watkins Harper; Harriet Beecher Stowe and the impact of Uncle Tom's Cabin (1852); the mass petition campaigns that made abolition a popular cause; and how exclusion — women barred from the 1840 World Anti-Slavery Convention — helped spark the women's rights movement at Seneca Falls (1848)."
          },
          {
            "title": "History of Civil Liberties",
            "summary": "How individual freedoms were won, defined, and defended — and repeatedly curtailed: Magna Carta (1215) and habeas corpus; the English Bill of Rights (1689); Enlightenment foundations (Locke, Montesquieu); the US Bill of Rights (1791) and the French Declaration of the Rights of Man and of the Citizen (1789); abolition of slavery; women's suffrage; the US civil rights movement (Brown v. Board 1954, Civil Rights Act 1964, Voting Rights Act 1965); the Universal Declaration of Human Rights (1948); free speech, press, assembly, religion, due process, and privacy; and the recurring wartime and security-era rollbacks (Alien and Sedition Acts, Japanese American internment, McCarthyism, post-9/11 surveillance) with defenders like the ACLU."
          }
        ]
      }
    ]
  },
  {
    "name": "Geography",
    "slug": "geography",
    "description": "",
    "tree": [
      {
        "title": "Physical Geography",
        "children": [
          {
            "title": "landforms"
          },
          {
            "title": "climate"
          },
          {
            "title": "ecosystems"
          },
          {
            "title": "hydrology"
          }
        ]
      },
      {
        "title": "Human Geography",
        "children": [
          {
            "title": "population"
          },
          {
            "title": "migration"
          },
          {
            "title": "urbanization"
          },
          {
            "title": "culture"
          }
        ]
      },
      {
        "title": "Economic Geography",
        "children": [
          {
            "title": "resources"
          },
          {
            "title": "trade"
          },
          {
            "title": "development"
          },
          {
            "title": "globalization"
          }
        ]
      },
      {
        "title": "Cartography & GIS",
        "children": [
          {
            "title": "maps"
          },
          {
            "title": "spatial data"
          },
          {
            "title": "remote sensing"
          }
        ]
      },
      {
        "title": "Regional Geography",
        "children": [
          {
            "title": "continents"
          },
          {
            "title": "countries"
          },
          {
            "title": "regional studies"
          }
        ]
      }
    ]
  },
  {
    "name": "Philosophy",
    "slug": "philosophy",
    "description": "",
    "tree": [
      {
        "title": "Logic",
        "children": [
          {
            "title": "arguments"
          },
          {
            "title": "fallacies"
          },
          {
            "title": "formal logic"
          },
          {
            "title": "reasoning"
          }
        ]
      },
      {
        "title": "Ethics",
        "children": [
          {
            "title": "moral theories"
          },
          {
            "title": "applied ethics"
          },
          {
            "title": "metaethics"
          }
        ]
      },
      {
        "title": "Metaphysics",
        "children": [
          {
            "title": "reality"
          },
          {
            "title": "existence"
          },
          {
            "title": "free will"
          },
          {
            "title": "mind & body"
          }
        ]
      },
      {
        "title": "Epistemology",
        "children": [
          {
            "title": "knowledge"
          },
          {
            "title": "belief"
          },
          {
            "title": "truth"
          },
          {
            "title": "skepticism"
          }
        ]
      },
      {
        "title": "Political Philosophy",
        "children": [
          {
            "title": "justice"
          },
          {
            "title": "rights"
          },
          {
            "title": "the state"
          },
          {
            "title": "liberty"
          }
        ]
      },
      {
        "title": "History of Philosophy",
        "children": [
          {
            "title": "ancient"
          },
          {
            "title": "medieval"
          },
          {
            "title": "modern"
          },
          {
            "title": "Hegel",
            "summary": "The system-builder of German idealism (1770–1831): the Phenomenology of Spirit (1807) — consciousness's journey to absolute knowing, the master-slave dialectic, and recognition; dialectic itself — negation, sublation (Aufhebung), and why 'thesis-antithesis-synthesis' is a caricature; the Science of Logic and the claim that the rational is the real; the Philosophy of Right — freedom actualized in family, civil society, and the state; the philosophy of history — world spirit, the cunning of reason, and history as the progress of the consciousness of freedom ('the owl of Minerva flies at dusk'); art, religion, and philosophy as absolute spirit; the split inheritance — Right Hegelians, Left Hegelians (Feuerbach, the young Marx standing Hegel 'on his head'), Kojève and recognition, Fukuyama's end of history; and the critics from Kierkegaard to the analytic Hegel revival (Pippin, Brandom)."
          },
          {
            "title": "Nietzsche's Anti-Foundationalist Critique of Morality and Truth",
            "summary": "Nietzsche's demolition of morality's and truth's foundations: the genealogy of morals — master and slave morality, ressentiment, and the ascetic ideal; the death of God (The Gay Science §125) and the specter of European nihilism; perspectivism and 'On Truth and Lies in a Nonmoral Sense' — truth as 'a mobile army of metaphors'; the critique of Kantian and Christian-Platonic foundations ('how the true world became a fable'); will to power; the revaluation of all values, the Übermensch, and eternal recurrence as affirmative responses; the self-reference problem — whether the critique undermines itself; and the legacy running through existentialism, Foucault's genealogies, and postmodern thought."
          },
          {
            "title": "Habermas: Discourse Ethics and Communicative Reason after Metaphysics",
            "summary": "Habermas's attempt to rebuild a pragmatic-transcendentalist theory of ethical and discursive reason after the collapse of metaphysics: postmetaphysical thinking and the linguistic turn from the philosophy of consciousness to communication; The Theory of Communicative Action (1981) — communicative versus strategic action and the validity claims of truth, rightness, and sincerity; universal pragmatics and the quasi-transcendental argument from the unavoidable presuppositions of argumentation (the performative contradiction against the skeptic); discourse ethics — principles (U) and (D) as an intersubjective reconstruction of Kant; the public sphere and deliberative democracy (Between Facts and Norms); and the debates — with Gadamer, Luhmann, Rawls, and the postmodernists — in defense of Enlightenment reason as an 'unfinished project'."
          },
          {
            "title": "Critical Theory",
            "summary": "The Frankfurt School and the tradition of emancipatory critique: the Institute for Social Research (1923) and Horkheimer's program — theory that aims to liberate, not merely describe; Adorno and Horkheimer's Dialectic of Enlightenment and the culture industry; Benjamin's theses on history and the Arcades; Marcuse and the one-dimensional society's sixties explosion; Fromm; the second generation — Habermas's communicative turn; the third — Honneth on recognition, Forst on justification; the wider critical family — Foucault's genealogies, postcolonial critique, critical race theory, feminist critical theory; and the standing question: what grounds critique after the collapse of foundations?"
          },
          {
            "title": "contemporary thinkers"
          }
        ]
      },
      {
        "title": "Aesthetics",
        "children": [
          {
            "title": "beauty"
          },
          {
            "title": "art"
          },
          {
            "title": "taste"
          },
          {
            "title": "interpretation"
          }
        ]
      }
    ]
  },
  {
    "name": "Religion & Theology",
    "slug": "religion-and-theology",
    "description": "",
    "tree": [
      {
        "title": "World Religions",
        "children": [
          {
            "title": "Christianity"
          },
          {
            "title": "Islam"
          },
          {
            "title": "Judaism"
          },
          {
            "title": "Hinduism"
          },
          {
            "title": "Buddhism"
          },
          {
            "title": "others"
          }
        ]
      },
      {
        "title": "Comparative Religion",
        "children": [
          {
            "title": "beliefs"
          },
          {
            "title": "practices"
          },
          {
            "title": "myths across traditions"
          }
        ]
      },
      {
        "title": "Theology",
        "children": [
          {
            "title": "doctrine"
          },
          {
            "title": "scripture"
          },
          {
            "title": "philosophy of religion"
          }
        ]
      },
      {
        "title": "Religious History",
        "children": [
          {
            "title": "origins"
          },
          {
            "title": "movements"
          },
          {
            "title": "reform"
          },
          {
            "title": "secularization"
          }
        ]
      },
      {
        "title": "Ethics & Religion",
        "children": [
          {
            "title": "moral teachings"
          },
          {
            "title": "religious law"
          }
        ]
      }
    ]
  },
  {
    "name": "Languages & Linguistics",
    "slug": "languages-and-linguistics",
    "description": "",
    "tree": [
      {
        "title": "Language Learning",
        "children": [
          {
            "title": "vocabulary"
          },
          {
            "title": "grammar"
          },
          {
            "title": "pronunciation"
          },
          {
            "title": "conversation"
          }
        ]
      },
      {
        "title": "Linguistics",
        "children": [
          {
            "title": "phonetics"
          },
          {
            "title": "syntax"
          },
          {
            "title": "semantics"
          },
          {
            "title": "morphology"
          }
        ]
      },
      {
        "title": "Sociolinguistics",
        "children": [
          {
            "title": "dialects"
          },
          {
            "title": "language & society"
          },
          {
            "title": "multilingualism"
          }
        ]
      },
      {
        "title": "Historical Linguistics",
        "children": [
          {
            "title": "language change"
          },
          {
            "title": "etymology"
          },
          {
            "title": "language families"
          }
        ]
      },
      {
        "title": "Translation & Interpretation",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "localization"
          },
          {
            "title": "bilingual skills"
          }
        ]
      }
    ]
  },
  {
    "name": "Literature & Writing",
    "slug": "literature-and-writing",
    "description": "",
    "tree": [
      {
        "title": "Literary Studies",
        "children": [
          {
            "title": "genres"
          },
          {
            "title": "movements"
          },
          {
            "title": "literary analysis"
          },
          {
            "title": "criticism"
          }
        ]
      },
      {
        "title": "World Literature",
        "children": [
          {
            "title": "classics"
          },
          {
            "title": "regional literatures"
          },
          {
            "title": "poetry"
          },
          {
            "title": "drama"
          },
          {
            "title": "fiction"
          }
        ]
      },
      {
        "title": "Creative Writing",
        "children": [
          {
            "title": "fiction"
          },
          {
            "title": "poetry"
          },
          {
            "title": "screenwriting"
          },
          {
            "title": "storytelling craft"
          }
        ]
      },
      {
        "title": "Composition & Rhetoric",
        "children": [
          {
            "title": "essays"
          },
          {
            "title": "argumentation"
          },
          {
            "title": "style"
          },
          {
            "title": "editing"
          }
        ]
      },
      {
        "title": "Journalism",
        "children": [
          {
            "title": "reporting"
          },
          {
            "title": "news writing"
          },
          {
            "title": "interviewing"
          },
          {
            "title": "media ethics"
          }
        ]
      }
    ]
  },
  {
    "name": "Visual Arts",
    "slug": "visual-arts",
    "description": "",
    "tree": [
      {
        "title": "Drawing & Painting",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "media"
          },
          {
            "title": "color theory"
          },
          {
            "title": "composition"
          }
        ]
      },
      {
        "title": "Art History",
        "children": [
          {
            "title": "periods"
          },
          {
            "title": "movements"
          },
          {
            "title": "major artists"
          },
          {
            "title": "analysis"
          }
        ]
      },
      {
        "title": "Sculpture & 3D",
        "children": [
          {
            "title": "materials"
          },
          {
            "title": "modeling"
          },
          {
            "title": "installation"
          }
        ]
      },
      {
        "title": "Photography",
        "children": [
          {
            "title": "composition"
          },
          {
            "title": "lighting"
          },
          {
            "title": "editing"
          },
          {
            "title": "genres"
          }
        ]
      },
      {
        "title": "Digital Art",
        "children": [
          {
            "title": "illustration"
          },
          {
            "title": "concept art"
          },
          {
            "title": "digital tools"
          }
        ]
      }
    ]
  },
  {
    "name": "Music",
    "slug": "music",
    "description": "",
    "tree": [
      {
        "title": "Music Theory",
        "children": [
          {
            "title": "notation"
          },
          {
            "title": "scales"
          },
          {
            "title": "harmony"
          },
          {
            "title": "rhythm"
          },
          {
            "title": "composition"
          }
        ]
      },
      {
        "title": "Music History",
        "children": [
          {
            "title": "periods"
          },
          {
            "title": "genres"
          },
          {
            "title": "composers"
          },
          {
            "title": "cultural context"
          }
        ]
      },
      {
        "title": "Instruments & Performance",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "practice"
          },
          {
            "title": "ensemble playing"
          }
        ]
      },
      {
        "title": "Voice & Singing",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "range"
          },
          {
            "title": "styles"
          }
        ]
      },
      {
        "title": "Music Production",
        "children": [
          {
            "title": "recording"
          },
          {
            "title": "mixing"
          },
          {
            "title": "electronic music"
          },
          {
            "title": "sound design"
          }
        ]
      }
    ]
  },
  {
    "name": "Performing Arts",
    "slug": "performing-arts",
    "description": "",
    "tree": [
      {
        "title": "Theatre & Drama",
        "children": [
          {
            "title": "acting"
          },
          {
            "title": "directing"
          },
          {
            "title": "playwriting"
          },
          {
            "title": "stagecraft"
          }
        ]
      },
      {
        "title": "Dance",
        "children": [
          {
            "title": "technique"
          },
          {
            "title": "choreography"
          },
          {
            "title": "styles"
          },
          {
            "title": "history"
          }
        ]
      },
      {
        "title": "Film & Television",
        "children": [
          {
            "title": "filmmaking"
          },
          {
            "title": "cinematography"
          },
          {
            "title": "editing"
          },
          {
            "title": "screenwriting"
          }
        ]
      },
      {
        "title": "Performance Studies",
        "children": [
          {
            "title": "improvisation"
          },
          {
            "title": "stage presence"
          },
          {
            "title": "production"
          }
        ]
      }
    ]
  },
  {
    "name": "Design & Architecture",
    "slug": "design-and-architecture",
    "description": "",
    "tree": [
      {
        "title": "Graphic Design",
        "children": [
          {
            "title": "layout"
          },
          {
            "title": "typography"
          },
          {
            "title": "branding"
          },
          {
            "title": "visual communication"
          }
        ]
      },
      {
        "title": "UX/UI Design",
        "children": [
          {
            "title": "user research"
          },
          {
            "title": "wireframing"
          },
          {
            "title": "prototyping"
          },
          {
            "title": "usability"
          }
        ]
      },
      {
        "title": "Product & Industrial Design",
        "children": [
          {
            "title": "form"
          },
          {
            "title": "function"
          },
          {
            "title": "materials"
          },
          {
            "title": "prototyping"
          }
        ]
      },
      {
        "title": "Fashion Design",
        "children": [
          {
            "title": "garments"
          },
          {
            "title": "textiles"
          },
          {
            "title": "pattern-making"
          },
          {
            "title": "trends"
          }
        ]
      },
      {
        "title": "Architecture",
        "children": [
          {
            "title": "design principles"
          },
          {
            "title": "structures"
          },
          {
            "title": "history"
          },
          {
            "title": "urban planning"
          }
        ]
      },
      {
        "title": "Interior Design",
        "children": [
          {
            "title": "space planning"
          },
          {
            "title": "materials"
          },
          {
            "title": "aesthetics"
          }
        ]
      }
    ]
  },
  {
    "name": "Media & Communication",
    "slug": "media-and-communication",
    "description": "",
    "tree": [
      {
        "title": "Communication Theory",
        "children": [
          {
            "title": "models"
          },
          {
            "title": "rhetoric"
          },
          {
            "title": "interpersonal communication"
          }
        ]
      },
      {
        "title": "Media Studies",
        "children": [
          {
            "title": "mass media"
          },
          {
            "title": "film"
          },
          {
            "title": "advertising"
          },
          {
            "title": "media effects"
          }
        ]
      },
      {
        "title": "Digital Media",
        "children": [
          {
            "title": "social media"
          },
          {
            "title": "content creation"
          },
          {
            "title": "online platforms"
          }
        ]
      },
      {
        "title": "Public Speaking",
        "children": [
          {
            "title": "presentation"
          },
          {
            "title": "persuasion"
          },
          {
            "title": "delivery"
          }
        ]
      },
      {
        "title": "Public Relations",
        "children": [
          {
            "title": "messaging"
          },
          {
            "title": "reputation"
          },
          {
            "title": "campaigns"
          }
        ]
      }
    ]
  },
  {
    "name": "Education & Learning",
    "slug": "education-and-learning",
    "description": "",
    "tree": [
      {
        "title": "Learning Science",
        "children": [
          {
            "title": "how people learn"
          },
          {
            "title": "memory"
          },
          {
            "title": "motivation"
          }
        ]
      },
      {
        "title": "Pedagogy",
        "children": [
          {
            "title": "teaching methods"
          },
          {
            "title": "Socratic teaching method",
            "summary": "Teaching by asking rather than telling: Socrates in Plato's dialogues — the elenchus (cross-examination that exposes contradictions), aporia as productive puzzlement, and maieutics, the 'midwifery' of drawing knowledge out (the slave-boy geometry lesson in the Meno); Socratic irony and the stance of knowing that one does not know; the method's modern descendants — the Socratic seminar and Paideia model in schools, the law-school case method from Langdell onward; what the research says about questioning, dialogue, and active learning; the critiques — intimidation versus inquiry, and when the method works or fails; and the original cautionary tale: Athens put Socrates to death for his questions."
          },
          {
            "title": "lesson design"
          },
          {
            "title": "assessment"
          }
        ]
      },
      {
        "title": "Educational Psychology",
        "children": [
          {
            "title": "development"
          },
          {
            "title": "differences"
          },
          {
            "title": "special needs"
          }
        ]
      },
      {
        "title": "Study Skills",
        "children": [
          {
            "title": "note-taking"
          },
          {
            "title": "time management"
          },
          {
            "title": "exam preparation"
          }
        ]
      },
      {
        "title": "Curriculum Design",
        "children": [
          {
            "title": "standards"
          },
          {
            "title": "objectives"
          },
          {
            "title": "evaluation"
          }
        ]
      }
    ]
  },
  {
    "name": "Practical & Life Skills",
    "slug": "practical-and-life-skills",
    "description": "",
    "tree": [
      {
        "title": "Personal Finance",
        "children": [
          {
            "title": "budgeting"
          },
          {
            "title": "saving"
          },
          {
            "title": "financial goals"
          },
          {
            "title": "banking"
          },
          {
            "title": "credit"
          },
          {
            "title": "loans & debt"
          },
          {
            "title": "taxes"
          },
          {
            "title": "insurance"
          },
          {
            "title": "investing"
          },
          {
            "title": "retirement"
          },
          {
            "title": "car buying"
          },
          {
            "title": "housing"
          },
          {
            "title": "scams & fraud"
          },
          {
            "title": "careers & employment"
          }
        ]
      },
      {
        "title": "Cooking & Food",
        "children": [
          {
            "title": "techniques"
          },
          {
            "title": "cuisines"
          },
          {
            "title": "baking"
          },
          {
            "title": "nutrition basics"
          }
        ]
      },
      {
        "title": "Health & Fitness",
        "children": [
          {
            "title": "exercise"
          },
          {
            "title": "training"
          },
          {
            "title": "wellbeing"
          },
          {
            "title": "sleep"
          }
        ]
      },
      {
        "title": "Digital Literacy",
        "children": [
          {
            "title": "productivity tools"
          },
          {
            "title": "online safety"
          },
          {
            "title": "research skills"
          }
        ]
      },
      {
        "title": "Communication & Soft Skills",
        "children": [
          {
            "title": "negotiation"
          },
          {
            "title": "teamwork"
          },
          {
            "title": "emotional intelligence"
          }
        ]
      },
      {
        "title": "Crafts & DIY",
        "children": [
          {
            "title": "woodworking"
          },
          {
            "title": "sewing"
          },
          {
            "title": "home repair"
          },
          {
            "title": "gardening"
          }
        ]
      }
    ]
  },
  {
    "name": "Classics",
    "slug": "classics",
    "description": "",
    "tree": [
      {
        "title": "The Greek World",
        "children": [
          {
            "title": "Archaic Greece"
          },
          {
            "title": "Classical Athens"
          },
          {
            "title": "Alexander and the Hellenistic Age"
          },
          {
            "title": "Greek Mythology"
          },
          {
            "title": "Greek Philosophy"
          },
          {
            "title": "Greek Drama"
          }
        ]
      },
      {
        "title": "The Roman World",
        "children": [
          {
            "title": "The Roman Republic"
          },
          {
            "title": "The Roman Empire"
          },
          {
            "title": "Roman Law"
          },
          {
            "title": "Roman Religion"
          },
          {
            "title": "Roman Literature"
          },
          {
            "title": "The Fall of Rome"
          }
        ]
      },
      {
        "title": "Classical Languages",
        "children": [
          {
            "title": "Ancient Greek"
          },
          {
            "title": "Latin"
          },
          {
            "title": "Classical Rhetoric"
          }
        ]
      },
      {
        "title": "Legacy of Antiquity",
        "children": [
          {
            "title": "Classical Reception"
          },
          {
            "title": "Archaeology of the Ancient World"
          },
          {
            "title": "Myth in Modern Culture"
          }
        ]
      }
    ]
  },
  {
    "name": "Neuroscience",
    "slug": "neuroscience",
    "description": "",
    "tree": [
      {
        "title": "Cellular Neuroscience",
        "children": [
          {
            "title": "Neurons"
          },
          {
            "title": "The Synapse"
          },
          {
            "title": "Action Potentials"
          },
          {
            "title": "Neurotransmitters"
          },
          {
            "title": "Glial Cells"
          }
        ]
      },
      {
        "title": "Brain Systems",
        "children": [
          {
            "title": "Vision"
          },
          {
            "title": "Hearing"
          },
          {
            "title": "Movement and Motor Control"
          },
          {
            "title": "The Limbic System"
          },
          {
            "title": "Sleep and Circadian Rhythms"
          }
        ]
      },
      {
        "title": "Cognitive Neuroscience",
        "children": [
          {
            "title": "Perception"
          },
          {
            "title": "Attention"
          },
          {
            "title": "Learning and Memory"
          },
          {
            "title": "Language"
          },
          {
            "title": "Consciousness"
          }
        ]
      },
      {
        "title": "Methods in Neuroscience",
        "children": [
          {
            "title": "Brain Imaging"
          },
          {
            "title": "Electrophysiology"
          },
          {
            "title": "Optogenetics"
          }
        ]
      },
      {
        "title": "Clinical Neuroscience",
        "children": [
          {
            "title": "Neuroplasticity"
          },
          {
            "title": "Neurodegeneration"
          },
          {
            "title": "Stroke and Brain Injury"
          },
          {
            "title": "The Neuroscience of Mental Illness"
          }
        ]
      }
    ]
  },
  {
    "name": "Statistics",
    "slug": "statistics",
    "description": "",
    "tree": [
      {
        "title": "Descriptive Statistics",
        "children": [
          {
            "title": "Measures of Center"
          },
          {
            "title": "Measures of Spread"
          },
          {
            "title": "Distributions"
          },
          {
            "title": "Data Visualization"
          }
        ]
      },
      {
        "title": "Probability",
        "children": [
          {
            "title": "Probability Basics"
          },
          {
            "title": "Random Variables"
          },
          {
            "title": "Common Distributions"
          },
          {
            "title": "Bayes' Theorem"
          }
        ]
      },
      {
        "title": "Statistical Inference",
        "children": [
          {
            "title": "Sampling"
          },
          {
            "title": "Estimation"
          },
          {
            "title": "Confidence Intervals"
          },
          {
            "title": "Hypothesis Testing"
          },
          {
            "title": "P-values and Significance"
          }
        ]
      },
      {
        "title": "Regression and Modeling",
        "children": [
          {
            "title": "Correlation"
          },
          {
            "title": "Linear Regression"
          },
          {
            "title": "Logistic Regression"
          },
          {
            "title": "ANOVA"
          }
        ]
      },
      {
        "title": "Modern Statistics",
        "children": [
          {
            "title": "Experimental Design"
          },
          {
            "title": "Bayesian Statistics"
          },
          {
            "title": "Resampling Methods"
          },
          {
            "title": "Statistical Learning"
          }
        ]
      }
    ]
  },
  {
    "name": "Africana Studies",
    "slug": "africana-studies",
    "description": "",
    "tree": [
      {
        "title": "African History",
        "children": [
          {
            "title": "Precolonial Africa"
          },
          {
            "title": "The Transatlantic Slave Trade"
          },
          {
            "title": "Colonial Africa"
          },
          {
            "title": "Decolonization"
          },
          {
            "title": "Contemporary Africa"
          }
        ]
      },
      {
        "title": "The African American Experience",
        "children": [
          {
            "title": "Slavery in America"
          },
          {
            "title": "Reconstruction"
          },
          {
            "title": "The Jim Crow Era"
          },
          {
            "title": "The Civil Rights Movement"
          },
          {
            "title": "Black Power and After"
          },
          {
            "title": "The Black Experience since 1865",
            "summary": "African American life from emancipation to now, as one arc: Reconstruction's promise — citizenship, the vote, Black officeholders — and its violent overthrow; Jim Crow, disfranchisement, and lynching (Ida B. Wells's crusade); the Great Migration and the making of Black urban America; the Harlem Renaissance; the Second World War and the Double V; the civil rights revolution and Black Power; the post-1968 turn — deindustrialization, the drug war, and mass incarceration (Alexander's The New Jim Crow); Black culture's global reach from the blues to hip-hop; Obama, Black Lives Matter, and the 1619 debates; and the persistent racial wealth gap and the reparations question (Coates)."
          }
        ]
      },
      {
        "title": "Black Thought and Politics",
        "children": [
          {
            "title": "Pan-Africanism"
          },
          {
            "title": "Black Feminism"
          },
          {
            "title": "Critical Race Theory"
          }
        ]
      },
      {
        "title": "Diaspora and Culture",
        "children": [
          {
            "title": "The African Diaspora"
          },
          {
            "title": "Black Literature"
          },
          {
            "title": "Black Music and Art"
          }
        ]
      }
    ]
  },
  {
    "name": "Asian Studies",
    "slug": "asian-studies",
    "description": "",
    "tree": [
      {
        "title": "East Asia",
        "children": [
          {
            "title": "Chinese History"
          },
          {
            "title": "Japanese History"
          },
          {
            "title": "Korean History"
          }
        ]
      },
      {
        "title": "South Asia",
        "children": [
          {
            "title": "Indian History"
          },
          {
            "title": "Religions of India"
          },
          {
            "title": "Modern South Asia"
          }
        ]
      },
      {
        "title": "Southeast Asia",
        "children": [
          {
            "title": "Southeast Asian History"
          },
          {
            "title": "Cultures of Southeast Asia"
          }
        ]
      },
      {
        "title": "Asian Thought",
        "children": [
          {
            "title": "Confucianism"
          },
          {
            "title": "Daoism"
          },
          {
            "title": "Buddhism"
          },
          {
            "title": "Hinduism"
          }
        ]
      },
      {
        "title": "Language and Literature",
        "children": [
          {
            "title": "East Asian Languages"
          },
          {
            "title": "Asian Literature"
          }
        ]
      }
    ]
  },
  {
    "name": "Gender Studies",
    "slug": "gender-studies",
    "description": "",
    "tree": [
      {
        "title": "Foundations",
        "children": [
          {
            "title": "Sex and Gender"
          },
          {
            "title": "Feminist Theory"
          },
          {
            "title": "Intersectionality"
          },
          {
            "title": "Patriarchy"
          }
        ]
      },
      {
        "title": "History of Feminism",
        "children": [
          {
            "title": "The First Wave"
          },
          {
            "title": "The Second Wave"
          },
          {
            "title": "Third and Fourth Waves"
          },
          {
            "title": "Global Feminisms"
          }
        ]
      },
      {
        "title": "Sexuality and Queer Studies",
        "children": [
          {
            "title": "LGBTQ History"
          },
          {
            "title": "Queer Theory"
          },
          {
            "title": "Identity and Sexuality"
          }
        ]
      },
      {
        "title": "Gender in Society",
        "children": [
          {
            "title": "Gender and Work"
          },
          {
            "title": "Gender and Politics"
          },
          {
            "title": "Media and Representation"
          },
          {
            "title": "Masculinities"
          }
        ]
      }
    ]
  },
  {
    "name": "Folklore & Mythology",
    "slug": "folklore-and-mythology",
    "description": "",
    "tree": [
      {
        "title": "World Mythologies",
        "children": [
          {
            "title": "Greek Mythology"
          },
          {
            "title": "Norse Mythology"
          },
          {
            "title": "Egyptian Mythology"
          },
          {
            "title": "Mesopotamian Mythology"
          },
          {
            "title": "Asian Mythologies"
          },
          {
            "title": "African Mythologies"
          }
        ]
      },
      {
        "title": "Folktales and Legends",
        "children": [
          {
            "title": "Fairy Tales"
          },
          {
            "title": "Legends"
          },
          {
            "title": "Urban Legends"
          },
          {
            "title": "Fables"
          }
        ]
      },
      {
        "title": "Myth and Motif",
        "children": [
          {
            "title": "Creation Myths"
          },
          {
            "title": "Hero Myths"
          },
          {
            "title": "Tricksters"
          },
          {
            "title": "The Afterlife"
          }
        ]
      },
      {
        "title": "Studying Myth",
        "children": [
          {
            "title": "Comparative Mythology"
          },
          {
            "title": "Folklore Theory"
          },
          {
            "title": "Oral Tradition"
          }
        ]
      }
    ]
  },
  {
    "name": "Film",
    "slug": "film",
    "description": "",
    "tree": [
      {
        "title": "Film History",
        "children": [
          {
            "title": "Silent Cinema"
          },
          {
            "title": "The Studio Era"
          },
          {
            "title": "World Cinema"
          },
          {
            "title": "The New Waves"
          },
          {
            "title": "Contemporary Film"
          }
        ]
      },
      {
        "title": "Film Theory and Criticism",
        "children": [
          {
            "title": "Film Language"
          },
          {
            "title": "Genre Theory"
          },
          {
            "title": "Auteur Theory"
          },
          {
            "title": "Film Criticism"
          }
        ]
      },
      {
        "title": "The Craft of Film",
        "children": [
          {
            "title": "Directing"
          },
          {
            "title": "Cinematography"
          },
          {
            "title": "Editing"
          },
          {
            "title": "Screenwriting"
          },
          {
            "title": "Sound Design"
          }
        ]
      },
      {
        "title": "Forms and Genres",
        "children": [
          {
            "title": "Documentary"
          },
          {
            "title": "Animation"
          },
          {
            "title": "Experimental Film"
          }
        ]
      }
    ]
  }
];

function slugify(s: string): string {
  return s
    .toLowerCase()
    .replace(/&/g, "and")
    .replace(/[^a-z0-9]+/g, "-")
    .replace(/(^-|-$)/g, "");
}

const subjects: Subject[] = [];
const nodes: Node[] = [];

SUBJECTS.forEach((subj, si) => {
  const subjectId = subj.slug;
  subjects.push({
    id: subjectId,
    name: subj.name,
    slug: subj.slug,
    description: subj.description,
    position: si,
  });

  const walk = (
    specs: NodeSpec[],
    parentId: string | null,
    parentPath: string[],
    depth: number,
  ) => {
    specs.forEach((spec, i) => {
      const slug = slugify(spec.title);
      const path = [...parentPath, slug];
      const id = `${subjectId}/${path.join("/")}`;
      nodes.push({
        id,
        subjectId,
        subjectSlug: subj.slug,
        parentId,
        title: spec.title,
        slug,
        summary: spec.summary ?? "",
        position: i,
        path,
        depth,
      });
      if (spec.children) walk(spec.children, id, path, depth + 1);
    });
  };

  walk(subj.tree, null, [], 0);
});

/** Number of nodes in a subject (used for the "N themes" label). */
export function themeCount(subjectId: string): number {
  return nodes.filter((n) => n.subjectId === subjectId).length;
}

export const SEED_SUBJECTS: Subject[] = subjects;
export const SEED_NODES: Node[] = nodes;
